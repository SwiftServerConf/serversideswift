import FluentMySQL
import Vapor

final class Talk: Codable {
    enum TalkType: String, Codable, ReflectionDecodable {

        case talk
        case workshop

        static func reflectDecoded() throws -> (Talk.TalkType, Talk.TalkType) {
            return (.talk, .workshop)
        }
    }

     enum VideoType: String, Codable, ReflectionDecodable {
        case youtube
        case vimeo
        case custom

        static func reflectDecoded() throws -> (Talk.VideoType, Talk.VideoType) {
            return (.youtube, .vimeo)
        }
    }

    var id: Int?

    var talkType: TalkType
    var title: String
    var description: String?
    var videoType: VideoType?
    var videoReference: String?
    var enabled: Bool

    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?

    init(
        id: Int? = nil,
        talkType: TalkType,
        title: String,
        description: String? = nil,
        videoType: VideoType? = nil,
        videoReference: String? = nil,
        enabled: Bool
    ) {
        self.id = id
        self.talkType = talkType
        self.title = title
        self.description = description
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
                Talk.reflectProperty(forKey: \.talkType),
                Talk.reflectProperty(forKey: \.description),
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

            builder.field(
                for: \.talkType,
                type: MySQLDataType.enum([
                    TalkType.talk.rawValue,
                    TalkType.workshop.rawValue,
                ])
            )

            builder.field(for: \.description, type: .text)
        }
    }
}
extension Talk: Parameter {}
