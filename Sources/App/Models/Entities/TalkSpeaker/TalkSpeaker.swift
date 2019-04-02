import FluentMySQL

struct TalkSpeaker: Codable {
    var id: Int?
    var talkID: Int
    var speakerID: Int

    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?
}

extension TalkSpeaker: MySQLModel {
    static let createdAtKey: TimestampKey? = \.createdAt
    static let updatedAtKey: TimestampKey? = \.updatedAt
    static let deletedAtKey: TimestampKey? = \.deletedAt
}

extension TalkSpeaker: Pivot {
    typealias Left = Talk
    typealias Right = Speaker

    static var leftIDKey: LeftIDKey = \.talkID
    static var rightIDKey: RightIDKey = \.speakerID
}

extension TalkSpeaker: ModifiablePivot {
    init(_ talk: Talk, _ speaker: Speaker) throws {
        talkID = try talk.requireID()
        speakerID = try speaker.requireID()
    }
}

extension TalkSpeaker: Migration {
    static func prepare(on connection: MySQLConnection) -> Future<Void> {
        return MySQLDatabase.create(self, on: connection) { builder in
            try addProperties(to: builder)
        }
    }
}
