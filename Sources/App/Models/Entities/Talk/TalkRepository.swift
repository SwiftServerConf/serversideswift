import Vapor
import FluentMySQL
import Foundation

protocol TalkRepository: ServiceType {
    func find(id: Int, enabled: Bool) -> Future<Talk?>
    func all(enabled: Bool) -> Future<[Talk]>
    func all(event: Event, enabled: Bool) throws -> Future<[(Talk, [Speaker])]>
    func all(speaker: Speaker, enabled: Bool) -> Future<[Talk]>
    func all(speaker: Speaker, event: Event, enabled: Bool) throws -> Future<[Talk]>
    func save(talk: Talk) -> Future<Talk>
}

final class MySQLTalkRepository: TalkRepository {
    let db: MySQLDatabase.ConnectionPool
    var speakerRepository: SpeakerRepository?

    init(_ db: MySQLDatabase.ConnectionPool, speakerRepository: SpeakerRepository?) {
        self.db = db
        self.speakerRepository = speakerRepository
    }

    func find(id: Int, enabled: Bool = true) -> EventLoopFuture<Talk?> {
        return db.withConnection { conn in
            return Talk
                .query(on: conn)
                .filter(Talk.idKey == id)
                .filter(\.enabled == enabled)
                .first()
        }
    }

    func all(enabled: Bool = true) -> EventLoopFuture<[Talk]> {
        return db.withConnection { conn in
            return Talk
                .query(on: conn)
                .filter(\.enabled == enabled)
                .sort(\.title, .ascending)
                .all()
        }
    }

    func all(event: Event, enabled: Bool) throws -> Future<[(Talk, [Speaker])]> {
        guard let eventID = event.id else { throw Abort(.badRequest) }
        guard let speakerRepository = self.speakerRepository else { throw Abort(.badRequest) }

        return db.withConnection { conn in
            return Talk
                .query(on: conn)
                .join(\ScheduleEntry.talkID, to: \Talk.id)
                .join(\Day.id, to: \ScheduleEntry.dayID)
                .join(\TalkSpeaker.talkID, to: \Talk.id)
                .join(\Speaker.id, to: \TalkSpeaker.speakerID)
                .filter(\Day.eventID == eventID)
                .filter(\Talk.enabled == enabled)
                .filter(\Talk.videoReference != nil)
                .sort(\ScheduleEntry.startTime, .ascending)
                .groupBy(\Talk.id)
                .all()
                .flatMap(to: [(Talk, [Speaker])].self) { talks in
                    return talks.map { talk in
                        return speakerRepository
                            .all(talk: talk, enabled: true)
                            .map { speakers in
                                (talk, speakers)
                            }
                    }
                    .flatten(on: conn)
                }
        }
    }

    func all(speaker: Speaker, enabled: Bool = true) -> EventLoopFuture<[Talk]> {
        return db.withConnection { conn in
            return try speaker.talks
                .query(on: conn)
                .filter(\.enabled == enabled)
                .sort(\.title, .ascending)
                .all()
        }
    }

    func all(speaker: Speaker, event: Event, enabled: Bool) throws -> Future<[Talk]> {
        guard let eventID = event.id else { throw Abort(.badRequest) }

        return db.withConnection { conn in
            return try speaker.talks
                .query(on: conn)
                .join(\ScheduleEntry.talkID, to: \Talk.id)
                .join(\Day.id, to: \ScheduleEntry.dayID)
                .filter(\Day.eventID == eventID)
                .filter(\Talk.enabled == enabled)
                .sort(\ScheduleEntry.startTime, .ascending)
                .groupBy(\Talk.id)
                .all()
        }
    }

    func save(talk: Talk) -> EventLoopFuture<Talk> {
        return db.withConnection { conn in
            return talk.save(on: conn)
        }
    }
}

//MARK: - ServiceType conformance
extension MySQLTalkRepository {
    static let serviceSupports: [Any.Type] = [TalkRepository.self]

    static func makeService(for worker: Container) throws -> MySQLTalkRepository {
        let conn = try worker.connectionPool(to: .mysql)
        let talkRepository = MySQLTalkRepository.init(conn, speakerRepository: nil)
        let speakerRepository = MySQLSpeakerRepository(conn, talkRepository: talkRepository)
        talkRepository.speakerRepository = speakerRepository
        return talkRepository
    }
}

fileprivate extension Speaker {
    // this planet's related tags
    var talks: Siblings<Speaker, Talk, TalkSpeaker> {
        return siblings()
    }
}
