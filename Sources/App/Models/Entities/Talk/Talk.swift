import FluentMySQL
import Vapor

final class Talk: Codable {
    var id: Int?

    var title: String
    var youTubeID: String?
    var enabled: Bool

    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?

    init(
        id: Int? = nil,
        title: String,
        youTubeID: String? = nil,
        enabled: Bool
    ) {
        self.id = id
        self.title = title
        self.youTubeID = youTubeID
        self.enabled = enabled
    }
}

extension Talk: MySQLModel {
    static let createdAtKey: TimestampKey? = \.createdAt
    static let updatedAtKey: TimestampKey? = \.updatedAt
    static let deletedAtKey: TimestampKey? = \.deletedAt
}

extension Talk: Content {}
extension Talk: Migration {
    static func prepare(on connection: MySQLConnection) -> Future<Void> {
        return MySQLDatabase.create(self, on: connection) { builder in
            try addProperties(to: builder)
        }
    }
}
extension Talk: Parameter {}
