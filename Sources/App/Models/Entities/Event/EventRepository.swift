import Vapor
import FluentMySQL
import Foundation

protocol EventRepository: ServiceType {
    func find(id: Int, enabled: Bool) -> Future<Event?>
    func find(slug: String, enabled: Bool) -> EventLoopFuture<Event?>
    func all(enabled: Bool) -> Future<[Event]>
    func save(event: Event) -> Future<Event>
}

final class MySQLEventRepository: EventRepository {
    let db: MySQLDatabase.ConnectionPool

    init(_ db: MySQLDatabase.ConnectionPool) {
        self.db = db
    }

    func find(id: Int, enabled: Bool = true) -> EventLoopFuture<Event?> {
        return db.withConnection { conn in
            return Event
                .query(on: conn)
                .filter(Event.idKey == id)
                .filter(\.enabled == enabled)
                .first()
        }
    }

    func find(slug: String, enabled: Bool = true) -> EventLoopFuture<Event?> {
        return db.withConnection { conn in
            return Event
                .query(on: conn)
                .filter(\Event.slug == slug)
                .filter(\.enabled == enabled)
                .first()
        }
    }

    func all(enabled: Bool = true) -> EventLoopFuture<[Event]> {
        return db.withConnection { conn in
            return Event
                .query(on: conn)
                .filter(\.enabled == enabled)
                .sort(\.order, .ascending)
                .all()
        }
    }

    func save(event: Event) -> EventLoopFuture<Event> {
        return db.withConnection { conn in
            return event.save(on: conn)
        }
    }
}

//MARK: - ServiceType conformance
extension MySQLEventRepository {
    static let serviceSupports: [Any.Type] = [EventRepository.self]

    static func makeService(for worker: Container) throws -> Self {
        return .init(try worker.connectionPool(to: .mysql))
    }
}
