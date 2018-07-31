extension Speaker: Parameterizable {
    public static var uniqueSlug: String {
        return "speaker"
    }

    public static func make(for parameter: String) throws -> Speaker {
        guard let speakerKey = Speaker.Keys(rawValue: parameter) else {
            throw SpeakerError.noSpeakerKeyForGivenParameter
        }
        return try Speaker.speaker(by: speakerKey)
    }
}

// Convenience access to single speaker from speaker list by speaker key
extension Speaker {
    static func speaker(by key: Speaker.Keys) throws -> Speaker {
        guard let speaker = allSpeaker().first(where: { speaker in speaker.key == key }) else {
            throw SpeakerError.noSpeakerForGivenSpeakerKey
        }
        return speaker
    }
}
