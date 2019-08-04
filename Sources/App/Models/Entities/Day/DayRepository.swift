import Vapor
import FluentMySQL
import Foundation

protocol DayRepository: ServiceType {
    func find(id: Int, enabled: Bool) -> Future<Day?>
    func all(enabled: Bool) -> Future<[Day]>
    func all(event: Event, enabled: Bool) throws -> EventLoopFuture<[Day]>
    func save(day: Day) -> Future<Day>
}

final class MySQLDayRepository: DayRepository {
    let db: MySQLDatabase.ConnectionPool

    init(_ db: MySQLDatabase.ConnectionPool) {
        self.db = db
    }

    func find(id: Int, enabled: Bool = true) -> EventLoopFuture<Day?> {
        return db.withConnection { conn in
            return Day
                .query(on: conn)
                .filter(Day.idKey == id)
                .filter(\.enabled == enabled)
                .first()
        }
    }

    func all(enabled: Bool = true) -> EventLoopFuture<[Day]> {
        return db.withConnection { conn in
            return Day
                .query(on: conn)
                .filter(\.enabled == enabled)
                .sort(\.date, .ascending)
                .all()
        }
    }

    func all(event: Event, enabled: Bool = true) throws -> EventLoopFuture<[Day]> {
        guard let id = event.id else { throw Abort(.badRequest) }

        return db.withConnection { conn in
            return Day
                .query(on: conn)
                .filter(\.eventID == id)
                .filter(\.enabled == enabled)
                .sort(\.date, .ascending)
                .all()
        }
    }

    func save(day: Day) -> EventLoopFuture<Day> {
        return db.withConnection { conn in
            return day.save(on: conn)
        }
    }
}

//MARK: - ServiceType conformance
extension MySQLDayRepository {
    static let serviceSupports: [Any.Type] = [DayRepository.self]

    static func makeService(for worker: Container) throws -> Self {
        return .init(try worker.connectionPool(to: .mysql))
    }
}
