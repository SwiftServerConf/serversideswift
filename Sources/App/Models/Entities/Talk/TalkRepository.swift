import Vapor
import FluentMySQL
import Foundation

protocol TalkRepository: ServiceType {
    func find(id: Int, enabled: Bool) -> Future<Talk?>
    func all(enabled: Bool) -> Future<[Talk]>
    func all(speaker: Speaker, enabled: Bool) -> Future<[Talk]>
    func save(talk: Talk) -> Future<Talk>
}

final class MySQLTalkRepository: TalkRepository {
    let db: MySQLDatabase.ConnectionPool

    init(_ db: MySQLDatabase.ConnectionPool) {
        self.db = db
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
                .filter(\.enabled == true)
                .sort(\.title, .ascending)
                .all()
        }
    }

    func all(speaker: Speaker, enabled: Bool = true) -> EventLoopFuture<[Talk]> {
        return db.withConnection { conn in
            return try speaker.talks
                .query(on: conn)
                .filter(\.enabled == true)
                .sort(\.title, .ascending)
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

    static func makeService(for worker: Container) throws -> Self {
        return .init(try worker.connectionPool(to: .mysql))
    }
}

fileprivate extension Speaker {
    // this planet's related tags
    var talks: Siblings<Speaker, Talk, TalkSpeaker> {
        return siblings()
    }
}
