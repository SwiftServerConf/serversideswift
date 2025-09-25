import Foundation
@preconcurrency import Plot

struct Talk: Eventable {
    let id: Int
    let title: String
    let description: Component
    let speakerNames: [String]
    let order: Int
    let eventSpecifics: EventSpecifics?
    let youtubeVideoID: String?
    let isWorkshop: Bool
    
    internal init(
        id: Int,
        title: String,
        description: String,
        speakerNames: [String],
        order: Int,
        eventSpecifics: EventSpecifics? = nil,
        youtubeVideoID: String? = nil,
        isWorkshop: Bool = false
    ) {
        self.id = id
        self.title = title
        self.description = Text(description)
        self.speakerNames = speakerNames
        self.order = order
        self.isWorkshop = isWorkshop
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
        youtubeVideoID: String? = nil,
        isWorkshop: Bool = false
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.speakerNames = speakerNames
        self.order = order
        self.eventSpecifics = eventSpecifics
        self.youtubeVideoID = youtubeVideoID
        self.isWorkshop = isWorkshop
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
            title: "Unlock Generative AI for Swift Server-Side Development",
            description: "In the rapidly evolving landscape of artificial intelligence, Swift developers are looking to integrate powerful language models into their applications. While AWS's Amazon Bedrock provides access to leading LLMs and generative AI capabilities, working with these services in strongly-typed languages like Swift presents unique challenges. The varying payload structures across different LLMs, combined with automatically generated SDKs that don't always align with Swift's elegant syntax patterns, can make implementation complex. This created an opportunity to develop a more Swift-idiomatic approach to working with Bedrock. So, I created the Swift Bedrock Library, that forms a layer on top of the AWS SDK for Swift for interacting with Amazon Bedrock. This library provides a convenient way to access Amazon Bedrock's capabilities from Swift applications. By providing clear, concise, and Swift-specific implementations, it accelerates the learning curve and enables developers to quickly take advantage of Bedrock's advanced models. From streaming chat to image generation or variation, the library covers a wide range of use cases. I also worked on the Swift Foundation Model Playground, an example web app that demonstrates the use of the Swift Bedrock Library. It is built with a front-end in React and a backend that uses Hummingbird. To help out developers that prefer to use the AWS SDK for Swift as is, I created the very first Swift code examples for Bedrock Runtime. These are now a part of the official AWS documentation and include chatting with Amazon Nova, Meta Llama and Anthropic Claude both with and without streaming responses. During my talk I will share the process I went through to during my internship and how the work I did can improve your experience when you decide to implement AI in your next project.",
            speakerNames: ["Mona Dierickx"],
            order: 1
        ),
        Talk(
            id: 2,
            title: "Battle of the Giants: Vapor vs Hummingbird which one should you choose?",
            description: ComponentGroup {
                Paragraph("There a wealth of server frameworks out there and it can be hard to make a decision on what framework to use. When opting for Swift as a server side programming languages there's a wealth of possibilities. However, two standout: Vapor and Hummingbird. Making a decision can be difficult, especially if one isn't aware of the tradeoffs picking one over the other entails. This talk aim is twofold: firstly, to compare and contrast both server-side frameworks. Secondly, to draw on their strengths and weaknesses to identify what use cases fit best with one or the other, giving attendees a way to evaluate their options, consider the different tradeoffs and ultimately make a better, more informed decision.")
                Paragraph("I'll start by rapidly introducing the benefits of writing Swift on the Server, the different options that are available to developers, some dead projects before narrowing down to the two Giants, Vapor and Hummingbird.")
                Paragraph("The first part of the talk will compare and contrast both frameworks. I'll run through the basic features of modern HTTP servers (routing, persistence, CORS, …) and compare how Vapor and Hummingbird have implemented them, specifically focusing on the Developer Experience.")
                Paragraph("The second part of the talk will be more opinionated and focus heavily on the advantages of picking one over the other. What are you sacrificing when picking Hummingbird over Vapor? What about the other way around? The second part of this talk should leave you with a sense of how to make those decisions and what framework to use when making decisions.")
                Paragraph("Ultimately my goal is for you to walk away from this talk being able to answer these two questions:")
                List {
                    ListItem("What are the main differences between Vapor and Hummingbird? What are their similarities?")
                    ListItem("What are the main tradeoffs when picking one over the other?")
                }
            },
            speakerNames: ["Emma GAUBERT"],
            order: 2
        ),
        Talk(
            id: 3,
            title: "Building Networking Libraries with Span and Concurrency",
            description: ComponentGroup {
                Paragraph("Networking is the fundamental backbone of Swift on Server. By combining the efficiency and ergonomics of Swift, you can make an incredibly scalable yet maintainable backend. In this talk, I'll show you the how and what of networking in Swift.")
                Paragraph("This talk dives into new and improved language features, such as Spans, Advanced Concurrency use and handling I/O.")
            },
            speakerNames: ["Joannis Orlandos"],
            order: 3
        ),
        Talk(id: 4, title: "How to Approach Approachable Concurrency", description: ComponentGroup {
            Paragraph("The Swift language has gone through many significant changes recently and this year is no different. We're now seeing some of the results of efforts to improve the approachability of data race safety. Many developers have found concurrency incredibly difficult to understand, making any improvements welcome. But, how can we use these new facilities to make our transition to Swift 6 easier?")
            Paragraph("We'll go through not just what new tools we have, but why they were introduced. Whether you are just now getting started or have lots of experience with concurrency, together we can deepen our understanding of the language. You'll come away feeling confident deciding how to best approach approachable concurrency for your project.")
        }, speakerNames: ["Matt Massicotte"], order: 4),
        Talk(
            id: 5,
            title: "Separate code from configuration with Swift Configuration",
            description: ComponentGroup {
                Paragraph("Swift Configuration provides a unified API for reading configuration values and secrets in server-side Swift libraries and applications. By separating the configuration reader from the underlying providers, services can seamlessly switch between different configuration sources: from environment variables and JSON files during development to sophisticated remote configuration systems in production.")
                Paragraph("This talk demonstrates how to gradually adopt Swift Configuration in your existing Swift libraries and services, starting with basic patterns like reading from environment variables and JSON files, then progressing to advanced scenarios including configuration hot-reloading, access logging, and building custom providers.")
                Paragraph("You’ll leave with practical knowledge and code examples that you can immediately apply to modernize configuration management in your Swift libraries and services.")
            },
            speakerNames: ["Honza Dvorsky"],
            order: 5),
        Talk(id: 6, title: "Getting started with gRPC Swift", description: "Looking to build fast, type-safe APIs in Swift? gRPC offers a high-performance alternative to REST using Protocol Buffers and HTTP/2. This session provides a brief introduction to gRPC Swift, guiding you through the concepts of gRPC, defining services in .proto files, generating Swift code, and implementing both clients and servers for various RPC types. Learn how gRPC Swift streamlines development and boosts performance for your applications.", speakerNames: ["George Barnett"], order: 6),
        Talk(
            id: 7, 
            title: "Observability in Server-Side Swift", 
            description: ComponentGroup {
                Paragraph("This talk provides an overview of observability in server-side Swift, comprised of Logging, Metrics, and Distributed Tracing. I'll start off by introducing and comparing the three fundamental API packages (swift-log / swift-metrics / swift-distributed-tracing), the latter of which I co-created as part of Google Summer of Code in 2020.")
                Paragraph("Throughout the talk, I'll be using a microservice-based server-side Swift backend, gradually adding more and more observability to it. This demo is powered by OpenTelemetry via the Swift OTel package, sending the observability data to a handful of backends.")
                Paragraph("At the end of my talk, you should understand what the three pillars of observability are and how to make use of them in your server-side Swift projects. As a bonus, you'll also learn about the OpenTelemetry project.")
                Paragraph("Links:")
                List {
                    ListItem {
                        Link("GitHub: apple/swift-log", url: "https://github.com/apple/swift-log")
                    }
                    ListItem {
                        Link("GitHub: apple/swift-metrics", url: "https://github.com/apple/swift-metrics")
                    }
                    ListItem {
                        Link("GitHub: apple/swift-distributed-tracing", url: "https://github.com/apple/swift-distributed-tracing")
                    }
                    ListItem {
                        Link("GitHub: swift-otel", url: "https://github.com/swift-otel")
                    }
                }
            }, 
            speakerNames: ["Moritz Lang"], 
            order: 7
        ),
        Talk(id: 8, title: "Introduction to Valkey-swift", description: "Valkey-swift is a new client library for Valkey, the in memory database. This talk will provide you with an introduction to both Valkey and the valkey-swift client. You will learn how Valkey is so much more than just a key/value datastore and how the valkey-swift client gives you access to some of Valkey's more advanced features.", speakerNames: ["Adam Fowler"], order: 8),
        Talk(
            id: 9, 
            title: "Swift Lambdas at Scale: How a Tiny iOS Team Built a Big Backend", 
            description: ComponentGroup {
                Paragraph("SongShift started out as an iOS app where everything was done client side. As our demand grew, in addition to the expectations of our customers, we wanted to move things to the server and needed a backend that could scale and function. As a small company, we didn't have a backend team, we didn't want to manage servers, and we didn't want to switch to a completely different language just to make it work.")
                Paragraph("I will share the journey of how my small team went from a simple client-side app to using cloud systems on AWS powered by Swift. I will share the things along the way that worked, didn’t work, and how we accidentally became backend engineers along the way.")
            }, 
            speakerNames: ["Ben Rosen"], 
            order: 9
        ),
        Talk(
            id: 10,
            title: "Exabyte Data Storage",
            description: ComponentGroup {
                Paragraph("We will demonstrate a Swift-based data storage solution, capable of storing and managing up to 100 exabytes of data. This data storage system is performant, scalable, distributed, and fully encrypted. It features: - Rapid user and key-to-file mapping with minimal and predictable disk seek time. - Robust chunk (blob) storage supporting fixed and variable chunk sizes. - Support for file checksums to ensure data integrity. - Automatic data healing to mitigate of bit rot. - Resilient architecture with no single point of failure, using automatic asynchronous replication. - Rack and data centre-aware replication with automatic performance monitoring and configuration adjustments. - Multi-layered metadata management optimised for data analysis and efficient compression of time-series data. - Automated recovery mechanisms to handle catastrophic hardware failures or complete data center outages. - Geographically-aware data storage to ensure compliance with regional data storage regulations (e.g., storing U.S. customer data exclusively in U.S.-based data centres) - Granular user- and organisation-based data access control.")
                Paragraph("Data access is provided through REST APIs and customisable callback APIs tailored for client-specific data analysis crawlers")
            },
            speakerNames: ["Georg Tuparev"],
            order: 10
        ),
        Talk(
            id: 11,
            title: "Protecting APIs with DeviceCheck, App Attest & WebAuthn",
            description: ComponentGroup {
                Paragraph("This talk is all about Apple's underutilised DeviceCheck framework and how you can use this framework to protect your server-side APIs from fraudulent use. We'll dive into detail on App Attest and its use of Secure Enclave, CBOR encoding and the WebAuthn standard which is also used for Passkeys. I'll talk through a reference implementation of the required server-side validation built in Swift using Vapor.")
                H3("Introduction to DeviceCheck framework")
                Paragraph("I'll explain how DeviceCheck can be used:")
                List {
                    ListItem("prevent users reusing offers and promotions in your app if they delete and reinstall it or even completely reset the device. All of this works in a privacy-friendly way without you knowing the identity of users.")
                    ListItem("detect and prevent access to your APIs from fraudulent copies of your app, this is the best answer to the question: “how do I secure API keys that my app needs?”")
                }
                H3("Asymmetric Cryptography")
                Paragraph("I'll give a brief introduction to asymmetric cryptography and how we can validate that tokens our app has have come from Apple and have not been tampered with. I'll build on this by explaining how the Secure Enclave gives us assurance that device keys cannot be copied or removed from the device. This means that a device can continue to authenticate with us over time, and we can be totally sure that it is the same device as before.")
                H3("App Attest")
                Paragraph {
                    Text("I'll talk through my ")
                    Link("reference implementation", url: "https://github.com/Oliver-Binns/app-attest")
                    Text("for App Attest which includes both the iOS client app and server-side validation using Swift and Vapor.")
                }
                Paragraph("We'll cover the implementation of App Attest step-by-step:")
                List {
                    ListItem("issuing a challenge from your backend")
                    ListItem("using that challenge to fetch an app attestation object on iOS")
                    ListItem("decode and validate the CBOR attestation object on your server")
                    ListItem("communicating with Apple's service to check for additional indicators of fraud")
                    ListItem("re-asserting as the same device for future requests")
                }.listStyle(.ordered)
                H3("Industry Standards")
                Paragraph("Finally, I will touch on some emerging industry standards:")
                List {
                    ListItem("App Attest is built on the WebAuthn standard which is the same standard that is used for Passkeys. This standard uses CBOR key-value data encoding, which is more efficient than JSON but is not human readable.")
                    ListItem("An alternative Client Attestation standard is also being developed as an extension of OAuth 2.0 which most apps use for login. This standard uses the JWT data format that app developers are more familiar with as access and refresh tokens.")
                }
            },
            speakerNames: ["Oliver Binns"],
            order: 11
        ),
        Talk(
            id: 12,
            title: "Write durable and resilient workflows in Swift",
            description: "Talk details to be announced soon",
            speakerNames: ["Franz Busch"],
            order: 12
        ),
        Talk(
            id: 13,
            title: "Expanding Swift/Java Interoperability",
            description: ComponentGroup {
                Paragraph("While Swift Java interoperability always allowed implementing Java native functions, or even calling Java code using JNI. And the the “jextract” mode of the swift-java tool can be used to automatically generate bindings for existing Swift libraries. Previously, this mode required the use of modern JDK versions and the Foreign Function and Memory APIs, and was unavailable to deployments using older Java versions, or platforms like e.g. Android.")
                Paragraph("During this year's Google Summer of Code, we worked on extending swift-java's jextract mode to support JNI as a fallback mechanism when the modern FFM APIs are not available. This means that we're now able to jextract entire Swift libraries and use them in Android applications! With the new Swift Android working group and the work on a official Android SDK, we believe this extension to Java interoperability will be very beneficial to the Swift on Android efforts! In this talk we will cover how the FFM mode and JNI modes work and differ. We will demonstrate how to build a Swift library that is shared across both Swift, Java (FFM) and Android (JNI)")
            },
            speakerNames: ["Mads Odgaard"],
            order: 13   
        ),
        Talk(
            id: 14, 
            title: "Beyond Web Services: Swift for Low-Level Container infrastructure", 
            description: ComponentGroup {
                Paragraph("With the Containerization and Container open source projects that Apple launched in June, we have shown that Swift is a compelling choice for systems-level infrastructure, expanding beyond its traditional application development roots. In this talk, we'll dive into our newly released container runtime project built entirely in Swift, exploring why we chose Swift and what we learned along the way")
                Paragraph("We'll cover:")
                List {
                    ListItem("Overview of Containerization")
                    ListItem("Core goals and design principles that drove our architectural decisions")
                    ListItem("Key Swift packages we created to facilitate a container runtime")
                    ListItem("Using Swift for systems development")
                    ListItem("Our experience as a team learning Swift and using it for low-level systems programming.")
                }
                Paragraph("This talk will demonstrate that Swift's reach extends far beyond iOS apps and web services—it's a viable, powerful choice for the most demanding systems programming tasks.")
            }, 
            speakerNames: ["Eric Ernst"], 
            order: 14
        ),
        Talk(
            id: 15,
            title: "Embedded Swift Workshop",
            description: "In this workshop, you'll learn how to use Swift to write software for embedded systems! We'll be using an ESP32 module to learn how to compile and run progams, trigger LEDs, deal with switches and even display images on a screen! Each participant will get their own ESP32 module to take home with them, along with the breadboard and all the other components you'll need.",
            speakerNames: ["Frank Lefebvre"],
            order: 15,
            isWorkshop: true
        ),
        Talk(
            id: 16, 
            title: "Understanding Isolation", 
            description: ComponentGroup {
                Paragraph("The foundation of Swift Concurrency's data race safety system is isolation. It is something many people struggle to understand, but using concurrency with success requires both a solid mental model as well as a command of the language features involved.")
                Paragraph("We're going to cover all forms of static isolation, learn what dynamic isolation is and when to use it. And, we'll also cover what Sendable is and how close a relationship it has with isolation. There will be an emphasis on approachable concurrency and how to understand and incorporate the newest language features.")
            }, 
            speakerNames: ["Matt Massicotte"], 
            order: 16, 
            isWorkshop: true
        ),
        Talk(
            id: 17, 
            title: "Swift Server Fundamentals", 
            description: ComponentGroup {
                Paragraph("In this hand-on workshop, learn how to build modern Swift server applications using Vapor 4, Swift OpenAPI, Swift ServiceLifecycle, Fluent with SQLite and Postgres, and serverless deployment with AWS.  Start by building `GET` endpoints to handle questions, then create a `PollsApp` where you build a database-connected application, and finally learn how to deploy applications.")
                Paragraph("This workshop consists of four 90-minute sessions where participants build an application that builds upon previous work. You are expected to bring your own laptop as we build the `PollsApp` together.")
            }, 
            speakerNames: ["Daniel Steinberg", "Nick Shook", "Agam Dua"], 
            order: 17, 
            isWorkshop: true
        ),
        Talk(
            id: 18,
            title: "Cryptography 101: What Every Swift Developer Should Understand",
            description: ComponentGroup {
                Paragraph("In a previous role as the tech lead of a team building a digital identity solution, I often saw developers using cryptography without fully grasping it. Whether during hiring, onboarding, or working with partners, I noticed a general lack of understanding about how the pieces fit together and why they work the way they do under the hood.")
                Paragraph("This talk aims to demystify the core concepts of cryptography (hashing, encryption, and digital signatures) in a way that's both accessible and directly useful. We won't dive into algorithmic details or math-heavy theory. Instead, I'll show you that having a basic understanding of those building blocks allows you to confidently approach most of the security you'll be faced with in your everyday work.")
                Paragraph("This talk is aimed at any developer with a basic understanding of Swift. No prior knowledge of security or cryptography is required.")
                Paragraph("Attendees will gain a practical understanding of core cryptographic concepts and how they apply to everyday development tasks, helping them build more secure, privacy-conscious apps.")
            },
            speakerNames: ["Eric Bariaux"],
            order: 18
        ),
        Talk(
            id: 19,
            title: "Server-Side Swift: Surviving or Thriving?",
            description: ComponentGroup {
                Paragraph("A common feature in many apps is having a profile picture. When adding this feature on the backend, we have to upload a photo, save the photo, and download the photo. This is pretty straight forward, but why did it take longer than expected?")
                Paragraph("The resources to learn how to do this common feature are limited. Last year, I challenged everyone to make some new piece of content around Server-Side Swift, let's explore what everyone created. How can we, as a community, help Server-Side Swift thrive and not just survive.")
            },
            speakerNames: ["Mikaela Caron"],
            order: 19,
            isWorkshop: false
        ),
        Talk(
            id: 20,
            title: "Lessons learned from running a SaaS entirely on Swift Vapor",
            description: ComponentGroup {
                Paragraph("Because Swift on the Server is not as well-known as, say, Node or Django, sometimes it's hard to find examples of what problems developers encounter once they scale beyond a certain point. There are hidden traps of technical debt that people will fall into, and there are surprising shortcuts if you know they're there. Sometimes it's just hard to choose a solution without any real-world examples.")
                Paragraph("I built a reasonably successful Software-as-a-Service startup entirely based on Swift, and I want to lay all my cards on the table: what services and SDKs are we using, how our project structure, architecture and testing looks like, how we solved technical and security problems, and of course what songs I sing to myself while SwiftNIO compiles for the 38th time today. There may also be sprinkles on how to use analytics properly and ethically, and I might just find one or two edge cases where Swift is not the right answer.")
            },
            speakerNames: ["Daniel Jilg"],
            order: 20
        ),
        Talk(
            id: 21,
            title: "Keynote",
            description: ComponentGroup {
                Paragraph("A special keynote presentation from the Swift team.")
            },
            speakerNames: ["Ben Cohen"],
            order: 21
        ),
        Talk(
            id: 22,
            title: "Effective Strategies for Testing and Releasing Server Side Changes",
            description: "Whether you are a solo developer or a team coordinating tens or hundreds of changes every day, making sure you don’t break your application is critical. This talk walks through some strategies to provide confidence in your changes and ensure they provide their designed functionality.",
            speakerNames: ["Simon Pilkington"],
            order: 22
        ),
    ]
}
