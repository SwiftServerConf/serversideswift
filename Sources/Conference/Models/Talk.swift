import Foundation
import Plot

struct Talk: Eventable {
    let id: Int
    let title: String
    let description: Component
    let speakerNames: [String]
    let eventSpecifics: EventSpecifics?
    
    internal init(
        id: Int,
        title: String,
        description: String,
        speakerNames: [String],
        eventSpecifics: EventSpecifics? = nil
    ) {
        self.id = id
        self.title = title
        self.description = Text(description)
        self.speakerNames = speakerNames
        self.eventSpecifics = eventSpecifics
    }
    
    internal init(
        id: Int,
        title: String,
        description: Component,
        speakerNames: [String],
        eventSpecifics: EventSpecifics? = nil
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.speakerNames = speakerNames
        self.eventSpecifics = eventSpecifics
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
            speakerNames: ["Daniel Steinberg"]
        ),
        // Talk(
        //     id: 4,
        //     title: "Fearless Caching in the Cloud",
        //     description: ComponentGroup {
        //         Paragraph("Swift is used at Apple not just for developing applications and operating systems but also large-scale distributed systems. To succeed, Swift is designed to support single process architectures and scale up to distributed systems across many processes and machines.")
        //         Paragraph("One system that fits particularly well with Swift at scale is Content-Addressable Storage (CAS).")
        //         Paragraph("In this talk, we will be exploring what CAS is and how it can represent entire file hierarchies. We will describe how we can use server-side Swift to build a CAS that performs precision caching even at scale.")
        //         Paragraph("Throughout the talk we will touch on the similarities between Swift’s design and the requirements of a CAS system, like how value types and the Sendable protocol mirror immutability concepts in CAS, and how these similarities help developers write a correct and reliable system at any scale.")
        //     },
        //     speakerNames: ["Johannes Weiss"]),
        
    ]
}
