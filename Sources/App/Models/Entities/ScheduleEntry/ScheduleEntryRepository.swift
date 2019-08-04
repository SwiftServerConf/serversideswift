import Vapor
import FluentMySQL
import Foundation

protocol ScheduleEntryRepository: ServiceType {
    func find(id: Int, enabled: Bool) -> Future<ScheduleEntry?>
    func all(enabled: Bool) -> Future<[ScheduleEntry]>
    func all(room: Room, enabled: Bool) throws -> Future<[ScheduleEntry]>
    func all(day: Day, enabled: Bool) throws -> EventLoopFuture<[(ScheduleEntry, Room?)]>
    func save(entry: ScheduleEntry) -> Future<ScheduleEntry>
}

final class MySQLScheduleEntryRepository: ScheduleEntryRepository {
    let db: MySQLDatabase.ConnectionPool

    init(_ db: MySQLDatabase.ConnectionPool) {
        self.db = db
    }

    func find(id: Int, enabled: Bool = true) -> EventLoopFuture<ScheduleEntry?> {
        return db.withConnection { conn in
            return ScheduleEntry
                .query(on: conn)
                .filter(ScheduleEntry.idKey == id)
                .filter(\.enabled == enabled)
                .first()
        }
    }

    func all(enabled: Bool = true) -> EventLoopFuture<[ScheduleEntry]> {
        return db.withConnection { conn in
            return ScheduleEntry
                .query(on: conn)
                .filter(\.enabled == enabled)
                .sort(\.startTime, .ascending)
                .all()
        }
    }

    func all(room: Room, enabled: Bool = true) throws -> EventLoopFuture<[ScheduleEntry]> {
        guard let roomID = room.id else {
            throw Abort(.badRequest, reason: "Missing ID on room")
        }

        return db.withConnection { conn in
            return ScheduleEntry
                .query(on: conn)
                .filter(\.roomID == roomID)
                .filter(\.enabled == enabled)
                .sort(\.startTime, .ascending)
                .all()
        }
    }

    func all(day: Day, enabled: Bool = true) throws -> EventLoopFuture<[(ScheduleEntry, Room?)]> {
        guard let dayID = day.id else {
            throw Abort(.badRequest, reason: "Missing ID on day")
        }

        return db.withConnection { conn in
            return ScheduleEntry
                .query(on: conn)
                .filter(\.dayID == dayID)
                .filter(\.enabled == enabled)
                .sort(\.startTime, .ascending)
                .all()
                .flatMap(to: [(ScheduleEntry, Room?)].self) { scheduleEntries in
                    return scheduleEntries.map { scheduleEntry in
                        return Room
                            .query(on: conn)
                            .filter(\.id == scheduleEntry.roomID)
                            .first()
                            .map { room in
                                return (scheduleEntry, room)
                            }
                    }
                    .flatten(on: conn)
                }
        }
    }

    func save(entry: ScheduleEntry) -> EventLoopFuture<ScheduleEntry> {
        return db.withConnection { conn in
            return entry.save(on: conn)
        }
    }
}

//MARK: - ServiceType conformance
extension MySQLScheduleEntryRepository {
    static let serviceSupports: [Any.Type] = [ScheduleEntryRepository.self]

    static func makeService(for worker: Container) throws -> Self {
        return .init(try worker.connectionPool(to: .mysql))
    }
}

extension Talk {
    var scheduleEntries: Children<Talk, ScheduleEntry> {
        return children(\.talkID)
    }
}
