import FluentMySQL
import Vapor

final class Room: Codable {
    var id: Int?
    var eventID: Int

    var title: String
    var order: Int
    var enabled: Bool

    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?

    init(
        id: Int? = nil,
        eventID: Int,
        title: String,
        order: Int,
        enabled: Bool
    ) {
        self.id = id
        self.eventID = eventID
        self.title = title
        self.order = order
        self.enabled = enabled
    }
}

extension Room: MySQLModel {
    static let createdAtKey: TimestampKey? = \.createdAt
    static let updatedAtKey: TimestampKey? = \.updatedAt
    static let deletedAtKey: TimestampKey? = \.deletedAt
}

extension Room: Content {}
extension Room: Migration {
    static func prepare(on connection: MySQLConnection) -> Future<Void> {
        return MySQLDatabase.create(self, on: connection) { builder in
            try addProperties(to: builder)
            builder.reference(from: \.eventID, to: \Event.id)
        }
    }
}
extension Room: Parameter {}
