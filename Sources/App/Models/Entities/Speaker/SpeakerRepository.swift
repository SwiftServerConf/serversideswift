import Vapor
import FluentMySQL
import Foundation

protocol SpeakerRepository: ServiceType {
    func find(id: Int, enabled: Bool) -> Future<Speaker?>
    func all(enabled: Bool) -> Future<[Speaker]>
    func all(talk: Talk, enabled: Bool) -> Future<[Speaker]>
    func all(event: Event, enabled: Bool) throws -> EventLoopFuture<[(Speaker, Talk)]>
    func save(speaker: Speaker) -> Future<Speaker>
}

final class MySQLSpeakerRepository: SpeakerRepository {
    let db: MySQLDatabase.ConnectionPool

    init(_ db: MySQLDatabase.ConnectionPool) {
        self.db = db
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

    func all(event: Event, enabled: Bool = true) throws -> EventLoopFuture<[(Speaker, Talk)]> {
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
                .sort(\Speaker.name, .ascending)
                .alsoDecode(Talk.self)
                .all()
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

    static func makeService(for worker: Container) throws -> Self {
        return .init(try worker.connectionPool(to: .mysql))
    }
}

extension Talk {
    // this planet's related tags
    var speakers: Siblings<Talk, Speaker, TalkSpeaker> {
        return siblings()
    }
}
