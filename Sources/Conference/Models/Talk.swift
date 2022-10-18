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
//            eventSpecifics: EventSpecifics(startTime: Date(at: "8:45"), endTime: Date(at: "10:00"), place: "Conference Room")
        ),
        
        Talk(
            id: 2,
            title: "How Prime Video Learned to Stop Worrying and Ingest at Scale",
            description: "Over the past four years, we have built a new Video-On-Demand Content Ingestion Orchestration layer using Swift-based backend components and a variety of AWS tools and services such as Fargate and Lambda. This layer is now being used at scale to support the launch of titles across Prime Video including high profile titles such as Lord of the Rings: The Rings of Power. This talk will dive into what we built, its architecture, how we applied lessons we learnt from our previous architecture and what we learnt from building the new one.",
            speakerNames: ["Simon Pilkington"]
//            eventSpecifics: EventSpecifics(startTime: Date(at: "8:45"), endTime: Date(at: "10:00"), place: "Conference Room")
        )
    ]
}
