import FluentMySQL
import Vapor

final class Talk: Codable {
     enum VideoType: String, Codable, ReflectionDecodable {
        case youtube
        case vimeo
        case custom

        static func reflectDecoded() throws -> (Talk.VideoType, Talk.VideoType) {
            return (.youtube, .vimeo)
        }
    }

    var id: Int?

    var title: String
    var videoType: VideoType?
    var videoReference: String?
    var enabled: Bool

    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?

    init(
        id: Int? = nil,
        title: String,
        videoType: VideoType? = nil,
        videoReference: String? = nil,
        enabled: Bool
    ) {
        self.id = id
        self.title = title
        self.videoType = videoType
        self.videoReference = videoReference
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
            try addProperties(to: builder, excluding: [
                Talk.reflectProperty(forKey: \.videoType)
            ])

            builder.field(
                for: \.videoType,
                type: MySQLDataType.enum([
                    VideoType.youtube.rawValue,
                    VideoType.vimeo.rawValue,
                    VideoType.custom.rawValue
                ])
            )
        }
    }
}
extension Talk: Parameter {}
