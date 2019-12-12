import Vapor
import FluentMySQL
import Foundation

protocol SpeakerRepository: ServiceType {
    func find(id: Int, enabled: Bool) -> Future<Speaker?>
    func find(slug: String, event: Event, enabled: Bool) throws -> EventLoopFuture<Speaker?>
    func find(scheduleEntry: ScheduleEntry, enabled: Bool) throws -> EventLoopFuture<([Speaker], Talk)?>
    func all(enabled: Bool) -> Future<[Speaker]>
    func all(talk: Talk, enabled: Bool) -> Future<[Speaker]>
    func all(event: Event, enabled: Bool) throws -> EventLoopFuture<[(Speaker, [Talk])]>
    func save(speaker: Speaker) -> Future<Speaker>
}

final class MySQLSpeakerRepository: SpeakerRepository {
    let db: MySQLDatabase.ConnectionPool
    let talkRepository: TalkRepository

    init(_ db: MySQLDatabase.ConnectionPool, talkRepository: TalkRepository) {
        self.db = db
        self.talkRepository = talkRepository
    }

    func find(id: Int, enabled: Bool = true) -> EventLoopFuture<Speaker?> {
        return db.withConnection { conn in
            return Speaker
                .query(on: conn)
                .filter(Speaker.idKey == id)
                .filter(\.enabled == enabled)
                .first()
        }
    }

    func find(slug: String, event: Event, enabled: Bool = true) throws -> EventLoopFuture<Speaker?> {
        guard let id = event.id else { throw Abort(.badRequest) }

        return db.withConnection { conn in
            return Speaker
                .query(on: conn)
                .join(\TalkSpeaker.speakerID, to: \Speaker.id)
                .join(\Talk.id, to: \TalkSpeaker.talkID)
                .join(\ScheduleEntry.talkID, to: \TalkSpeaker.talkID)
                .join(\Day.id, to: \ScheduleEntry.dayID)
                .filter(\Day.eventID == id)
                .filter(\Speaker.slug == slug)
                .filter(\Speaker.enabled == enabled)
                .first()
        }
    }

    func find(scheduleEntry: ScheduleEntry, enabled: Bool = true) throws -> EventLoopFuture<([Speaker], Talk)?> {
        guard let id = scheduleEntry.id else { throw Abort(.badRequest) }

        return db.withConnection { conn in
            let talk = Talk
                .query(on: conn)
                .join(\ScheduleEntry.talkID, to: \Talk.id)
                .filter(\ScheduleEntry.id == id)
                .filter(\Talk.enabled == enabled)
                .first()

            let speakers = Speaker
                .query(on: conn)
                .join(\TalkSpeaker.speakerID, to: \Speaker.id)
                .join(\Talk.id, to: \TalkSpeaker.talkID)
                .join(\ScheduleEntry.talkID, to: \TalkSpeaker.talkID)
                .join(\Day.id, to: \ScheduleEntry.dayID)
                .filter(\ScheduleEntry.id == id)
                .filter(\Speaker.enabled == enabled)
                .all()

            return speakers.and(talk).map { speakersAndTalk in
                let (speakers, talk) = speakersAndTalk
                guard let unwrappedTalk = talk else { return nil }
                return (speakers, unwrappedTalk)
            }
        }
    }

    func all(enabled: Bool = true) -> EventLoopFuture<[Speaker]> {
        return db.withConnection { conn in
            return Speaker
                .query(on: conn)
                .filter(\.enabled == enabled)
                .sort(\.name, .ascending)
                .all()
        }
    }

    func all(talk: Talk, enabled: Bool = true) -> EventLoopFuture<[Speaker]> {
        return db.withConnection { conn in
            return try talk.speakers
                .query(on: conn)
                .filter(\.enabled == enabled)
                .sort(\.name, .ascending)
                .all()
        }
    }

    func all(event: Event, enabled: Bool = true) throws -> EventLoopFuture<[(Speaker, [Talk])]> {
        guard let id = event.id else { throw Abort(.badRequest) }

        return db.withConnection { conn in
            return Speaker
                .query(on: conn)
                .join(\TalkSpeaker.speakerID, to: \Speaker.id)
                .join(\Talk.id, to: \TalkSpeaker.talkID)
                .join(\ScheduleEntry.talkID, to: \TalkSpeaker.talkID)
                .join(\Day.id, to: \ScheduleEntry.dayID)
                .filter(\Day.eventID == id)
                .filter(\Speaker.enabled == enabled)
                .sort(\Speaker.order, .ascending)
                .groupBy(\Speaker.id)
                .all()
                .flatMap(to: [(Speaker, [Talk])].self) { speakers in
                    return try speakers.map { speaker in
                        return try self.talkRepository
                            .all(speaker: speaker, event: event, enabled: true)
                            .map { talks in
                                (speaker, talks)
                            }
                    }
                    .flatten(on: conn)
                }
        }
    }

    func save(speaker: Speaker) -> EventLoopFuture<Speaker> {
        return db.withConnection { conn in
            return speaker.save(on: conn)
        }
    }
}

//MARK: - ServiceType conformance
extension MySQLSpeakerRepository {
    static let serviceSupports: [Any.Type] = [SpeakerRepository.self]

    static func makeService(for worker: Container) throws -> MySQLSpeakerRepository {
        let conn = try worker.connectionPool(to: .mysql)
        let talkRepository = MySQLTalkRepository.init(conn, speakerRepository: nil)
        let speakerRepository = MySQLSpeakerRepository(conn, talkRepository: talkRepository)
        talkRepository.speakerRepository = speakerRepository
        return speakerRepository
    }
}

extension Talk {
    var speakers: Siblings<Talk, Speaker, TalkSpeaker> {
        return siblings()
    }
}
