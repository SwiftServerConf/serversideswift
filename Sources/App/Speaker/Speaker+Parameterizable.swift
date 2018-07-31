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

// Convenience access to speaker list by speaker key
extension Speaker {
    static func speaker(by name: Speaker.Keys) throws -> Speaker {
        guard let speaker = allSpeaker()[name.rawValue] else {
            throw SpeakerError.noSpeakerForGivenSpeakerKey
        }
        return speaker
    }
}
