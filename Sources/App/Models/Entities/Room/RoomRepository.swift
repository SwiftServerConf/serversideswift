import Vapor
import FluentMySQL
import Foundation

protocol RoomRepository: ServiceType {
    func find(id: Int, enabled: Bool) -> Future<Room?>
    func all(enabled: Bool) -> Future<[Room]>
    func save(room: Room) -> Future<Room>
}

final class MySQLRoomRepository: RoomRepository {
    let db: MySQLDatabase.ConnectionPool

    init(_ db: MySQLDatabase.ConnectionPool) {
        self.db = db
    }

    func find(id: Int, enabled: Bool = true) -> EventLoopFuture<Room?> {
        return db.withConnection { conn in
            return Room
                .query(on: conn)
                .filter(Room.idKey == id)
                .filter(\.enabled == enabled)
                .first()
        }
    }

    func all(enabled: Bool = true) -> EventLoopFuture<[Room]> {
        return db.withConnection { conn in
            return Room
                .query(on: conn)
                .filter(\.enabled == enabled)
                .sort(\.order, .ascending)
                .all()
        }
    }

    func save(room: Room) -> EventLoopFuture<Room> {
        return db.withConnection { conn in
            return room.save(on: conn)
        }
    }
}

//MARK: - ServiceType conformance
extension MySQLRoomRepository {
    static let serviceSupports: [Any.Type] = [RoomRepository.self]

    static func makeService(for worker: Container) throws -> Self {
        return .init(try worker.connectionPool(to: .mysql))
    }
}
