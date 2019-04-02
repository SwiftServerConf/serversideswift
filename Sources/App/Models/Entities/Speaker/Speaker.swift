import FluentMySQL
import Vapor

final class Speaker: Codable {
    var id: Int?

    var name: String
    var title: String
    var company: String?
    var bio: String
    var twitterURL: String?
    var gitHubURL: String?

    var order: Int
    var enabled: Bool

    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?

    init(
        id: Int? = nil,
        name: String,
        title: String,
        company: String? = nil,
        bio: String,
        twitterURL: String? = nil,
        gitHubURL: String? = nil,
        order: Int,
        enabled: Bool
    ) {
        self.id = id
        self.name = name
        self.title = title
        self.company = company
        self.bio = bio
        self.twitterURL = twitterURL
        self.gitHubURL = gitHubURL
        self.order = order
        self.enabled = enabled
    }
}

extension Speaker: MySQLModel {
    static let createdAtKey: TimestampKey? = \.createdAt
    static let updatedAtKey: TimestampKey? = \.updatedAt
    static let deletedAtKey: TimestampKey? = \.deletedAt
}

extension Speaker: Content {}
extension Speaker: Migration {
    static func prepare(on connection: MySQLConnection) -> Future<Void> {
        return MySQLDatabase.create(self, on: connection) { builder in
            try addProperties(to: builder)
        }
    }
}
extension Speaker: Parameter {}
