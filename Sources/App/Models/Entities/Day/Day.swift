import FluentMySQL
import Vapor

final class Day: Codable {
    var id: Int?
    var eventID: Int

    var date: Date
    var title: String
    var enabled: Bool

    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?

    init(
        id: Int? = nil,
        eventID: Int,
        date: Date,
        title: String,
        enabled: Bool
    ) {
        self.id = id
        self.eventID = eventID
        self.date = date
        self.title = title
        self.enabled = enabled
    }
}

extension Day: MySQLModel {
    static let createdAtKey: TimestampKey? = \.createdAt
    static let updatedAtKey: TimestampKey? = \.updatedAt
    static let deletedAtKey: TimestampKey? = \.deletedAt
}

extension Day: Content {}
extension Day: Migration {
    static func prepare(on connection: MySQLConnection) -> Future<Void> {
        return MySQLDatabase.create(self, on: connection) { builder in
            try addProperties(to: builder)
            builder.reference(from: \.eventID, to: \Event.id)
        }
    }
}
extension Day: Parameter {}

extension Day {
    var scheduleEntries: Children<Day, ScheduleEntry> {
        return children(\.dayID)
    }
}
