import Foundation

struct Talk: Eventable {
    let id: Int
    let title: String
    let description: String
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
            title: "Canonical distributed Deb and Snap packaging of the Swift toolchain for Linux",
            description: "Swift is the language for modern, powerful apps on Apple’s platforms. However, the language feature set and CPU architecture support gives it enormous potential as an approachable, memory safe systems programming capable language for example to build server backends and programs in heterogeneous low memory footprint environments, for example in IoT devices. The multi-year work of the Swift Server Work Group, the recent addition of structured concurrency to the language, the associated effort towards Distributed Actors, and the already some years available dynamic callable support, are just some examples of the kind of powerful capabilities that have applications for Linux based programming for servers and IoT alike. The Linux packaging story of Swift has however remained partial and fragmented compared to other popular languages in the same category where packages are readily available, focusing in case of Linux more on deployment time considerations (Docker images) than development time needs. At Canonical, as the distributors of Ubuntu Linux and creators of the cross distribution Snap packaging format, we recognise the potential Swift has. In this talk I would like to announce availability of deb and Snap packaging of the Swift toolchain, and to demonstrate a Linux based development workflow, demonstrating several Linux based uses for the language, ranging from servers to IoT devices.",
            speakerNames: ["Matias Piipari"]
        ),
        Talk(
            id: 2,
            title: "How Prime Video Learned to Stop Worrying and Ingest at Scale",
            description: "Over the past four years, we have built a new Video-On-Demand Content Ingestion Orchestration layer using Swift-based backend components and a variety of AWS tools and services such as Fargate and Lambda. This layer is now being used at scale to support the launch of titles across Prime Video including high profile titles such as Lord of the Rings: The Rings of Power. This talk will dive into what we built, its architecture, how we applied lessons we learnt from our previous architecture and what we learnt from building the new one.",
            speakerNames: ["Simon Pilkington"]
        ),
        Talk(
            id: 3,
            title: "Structured concurrency for server developers",
            description: "Swift Concurrency revolutionized concurrent and parallel programming in Swift. Concurrency added a number of important features, such as actors and the async/await syntax, that make it easier than ever to write correct concurrent code in Swift. These features have been widely adopted in the server ecosystem, and they’re empowering server developers to write better services than ever before.\nAlongside these features, Swift Concurrency introduced the new programming style of structured concurrency. Adopting structured concurrency brings a wide range of benefits: it makes object lifetimes simpler, makes it easier to clean up, ensures errors aren’t lost, and makes it easier to reason about your concurrent code.\nIn this talk, we will introduce the concepts at the heart of structured concurrency and explains the value your services get from adopting it. We will then lay out a recommended structure for adopting structured concurrency on the server, including how to write NIO-based services with this new pattern.",
            speakerNames: ["Cory Benfield"]),
        Talk(
            id: 4,
            title: "Swift at scale",
            description: "Swift is used at Apple not just for developing applications and operating systems but also large-scale distributed systems. To succeed, Swift is designed to support single process architectures and scale up to distributed systems across many processes and machines.\nOne system that fits particularly well with Swift at scale is Content-Addressable Storage (CAS).\nIn this talk, we will be exploring what CAS is and how it can represent entire file hierarchies. We will describe how we can use server-side Swift to build a CAS that performs precision caching even at scale.\nThroughout the talk we will touch on the similarities between Swift’s design and the requirements of a CAS system, like how value types and the Sendable protocol mirror immutability concepts in CAS, and how these similarities help developers write a correct and reliable system at any scale.",
            speakerNames: ["Johannes Weiss"]),
        Talk(
            id: 5,
            title: "Globally distributed Server Side Swift",
            description: "Learn how to deploy Swift applications to the edge, while only paying for what you use. ",
            speakerNames: ["Andrew Barba"])
    ]
}
