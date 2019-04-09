import FluentMySQL
import MySQL
import Vapor

final class ScheduleEntry: Codable {
     enum EntryType: String, Codable, ReflectionDecodable {
        case talk
        case workshop
        case other

        static func reflectDecoded() throws -> (ScheduleEntry.EntryType, ScheduleEntry.EntryType) {
            return (.talk, .workshop)
        }
    }

    var id: Int?
    var roomID: Int
    var talkID: Int?

    var title: String?
    var startTime: Date
    var endTime: Date
    var entryType: EntryType
    var enabled: Bool

    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?

    init(
        id: Int? = nil,
        roomID: Int,
        talkID: Int?,
        title: String?,
        startTime: Date,
        endTime: Date,
        entryType: EntryType,
        enabled: Bool
    ) {
        self.id = id
        self.roomID = roomID
        self.talkID = talkID
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.entryType = entryType
        self.enabled = enabled
    }
}

extension ScheduleEntry: MySQLModel {
    static let createdAtKey: TimestampKey? = \.createdAt
    static let updatedAtKey: TimestampKey? = \.updatedAt
    static let deletedAtKey: TimestampKey? = \.deletedAt
}

extension ScheduleEntry: Content {}
extension ScheduleEntry: Migration {
    static func prepare(on connection: MySQLConnection) -> Future<Void> {
        return MySQLDatabase.create(self, on: connection) { builder in
            try addProperties(to: builder, excluding: [
                ScheduleEntry.reflectProperty(forKey: \.entryType)
            ])

            builder.field(
                for: \.entryType,
                type: MySQLDataType.enum([
                    EntryType.talk.rawValue,
                    EntryType.workshop.rawValue,
                    EntryType.other.rawValue
                ])
            )

            builder.reference(from: \.roomID, to: \Room.id)
            builder.reference(from: \.talkID, to: \Talk.id)
        }
    }
}
extension ScheduleEntry: Parameter {}
