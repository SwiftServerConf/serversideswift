import Foundation
import Plot

struct Talk: Eventable {
    let id: Int
    let title: String
    let description: Component
    let speakerNames: [String]
    let order: Int
    let eventSpecifics: EventSpecifics?
    let youtubeVideoID: String?
    
    internal init(
        id: Int,
        title: String,
        description: String,
        speakerNames: [String],
        order: Int,
        eventSpecifics: EventSpecifics? = nil,
        youtubeVideoID: String? = nil
    ) {
        self.id = id
        self.title = title
        self.description = Text(description)
        self.speakerNames = speakerNames
        self.order = order
        self.eventSpecifics = eventSpecifics
        self.youtubeVideoID = youtubeVideoID
    }
    
    internal init(
        id: Int,
        title: String,
        description: Component,
        speakerNames: [String],
        order: Int,
        eventSpecifics: EventSpecifics? = nil,
        youtubeVideoID: String? = nil
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.speakerNames = speakerNames
        self.order = order
        self.eventSpecifics = eventSpecifics
        self.youtubeVideoID = youtubeVideoID
    }
    
    var speakers: [Speaker] {
        AllSpeakers.speakers.filter {
            self.speakerNames.contains($0.name)
        }
    }
}

struct AllTalks {
    static let talks: [Talk] = [
        Talk(
            id: 1,
            title: "When to Make a Macro",
            description: "Over the years you have developed a collection of techniques for reducing repetitive and boilerplate code for server side Swift. If you are using Swift 5.9 or above you should consider adding Swift Macros to your tool belt. This fast moving session introduces you to freestanding and attached macros with some examples from each type that shows you when you should use them and how.",
            speakerNames: ["Daniel Steinberg"],
            order: 2,
            youtubeVideoID: "MroBR2ProT0"
        ),
    ]
}
