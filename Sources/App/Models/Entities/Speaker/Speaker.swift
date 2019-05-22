import FluentMySQL
import Vapor

final class Speaker: Codable {
    var id: Int?

    var slug: String
    var name: String
    var title: String
    var company: String?
    var imageURL: String?
    var bio: String
    var twitterHandle: String?
    var gitHubHandle: String?

    var order: Int
    var enabled: Bool

    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?

    init(
        id: Int? = nil,
        slug: String,
        name: String,
        title: String,
        company: String? = nil,
        imageURL: String? = nil,
        bio: String,
        twitterHandle: String? = nil,
        gitHubHandle: String? = nil,
        order: Int,
        enabled: Bool
    ) {
        self.id = id
        self.slug = slug
        self.name = name
        self.title = title
        self.company = company
        self.imageURL = imageURL
        self.bio = bio
        self.twitterHandle = twitterHandle
        self.gitHubHandle = gitHubHandle
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
            try addProperties(to: builder, excluding: [
                Speaker.reflectProperty(forKey: \.bio)
            ])
            builder.field(for: \.bio, type: .text)
        }
    }
}
extension Speaker: Parameter {
    public static func resolveParameter(_ parameter: String, on container: Container) throws -> Future<Speaker> {
        func findModel(in connection: Database.Connection) throws -> Future<Speaker> {
            return Speaker.query(on: connection).filter(\.slug == parameter).first().map { model in
                guard let model = model else {
                    throw Abort(.notFound)
                }
                return model
            }
        }

        let dbid = try Speaker.requireDefaultDatabase()
        return container.withPooledConnection(to: dbid, closure: findModel)
    }
}
