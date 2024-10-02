import Foundation
import Plot

struct Talk: Eventable {
    let id: Int
    let title: String
    let description: Component
    let speakerNames: [String]
    let eventSpecifics: EventSpecifics?
    let youtubeVideoID: String?
    
    internal init(
        id: Int,
        title: String,
        description: String,
        speakerNames: [String],
        eventSpecifics: EventSpecifics? = nil,
        youtubeVideoID: String? = nil
    ) {
        self.id = id
        self.title = title
        self.description = Text(description)
        self.speakerNames = speakerNames
        self.eventSpecifics = eventSpecifics
        self.youtubeVideoID = youtubeVideoID
    }
    
    internal init(
        id: Int,
        title: String,
        description: Component,
        speakerNames: [String],
        eventSpecifics: EventSpecifics? = nil,
        youtubeVideoID: String? = nil
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.speakerNames = speakerNames
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
            youtubeVideoID: "MroBR2ProT0"
        ),
        Talk(
            id: 2,
            title: "Swift on Server: How it powers Private Cloud Compute",
            description: "Swift on Server brings the privacy, security and ease of use of Swift to servers. In this talk we explore the way Apple is using Swift on Server to help run Private Cloud Compute which enables Apple Intelligence to leverage larger AI models while maintaining strict privacy promises for users. This talk will explore the construction on the on-node pieces of Private Cloud Compute. We’ll discuss how the service fits together from the perspective of the node, go through which technologies we deployed for this service, and showcase how Swift on Server was uniquely positioned for Apple to be able to build this service.",
            speakerNames: ["Cory Benfield"]
        ),
        Talk(
            id: 3,
            title: "The Adventures and Misadventures of Building a Trivia app with Vapor",
            description: "This talk goes through my process of building Lyriq’s (A Trivia Game) backend and the challenges, issues and assumptions I had to overcome to think properly about building on the web. Initially relying on my experience of iOS Development and then finding new ways of thinking about development on the web. The talk also goes through some of the initial gotchas i had with providers like Heroku and Fly and how I solved them. I think this talk would be quite actionable for people thinking about Backend Development using Vapor while coming from iOS Development and mistakes to avoid.",
            speakerNames: ["Adegboyega Olusunmade"],
            youtubeVideoID: "QGO5ZuWM5pY"
        ),
        Talk(
            id: 4,
            title: "Generating static websites using Swift on the server",
            description: ComponentGroup {
                Paragraph("Swift on the server is a great way to create backend applications. This time, we’re diving into something special: a static site generator.")
                Paragraph("No databases, no persistence—just the magic of turning a bunch of Markdown files into a raw HTML-based website using Swift and the new Swift-Mustache library from the Hummingbird project.")
                Paragraph("You’ll learn how to adapt the Swift-Markdown library for your projects and how to create custom directives when rendering Markdown files. This is a great opportunity to understand the technology that powers DocC, Swift’s documentation framework.")
                Paragraph("Tibor will share the challenges he faced while building Toucan and show how easy it is to set up an HTTP server and host static files using the Hummingbird framework. He will also provide tips on optimizing your site for better performance and SEO.")
                Paragraph("If you’re planning to create a blog or want to build beautiful user guides for your upcoming library, this talk is perfect for you. You’ll walk away with practical knowledge and inspiration to get started building a website for your future project.")
            },
            speakerNames: ["Tibor Bödecs"],
            youtubeVideoID: "FuTpnddLhpU"
        ),
        Talk(
            id: 5,
            title: "The Success Story of Server-Side Swift at Cultured Code",
            description: ComponentGroup {
                Paragraph("At Cultured Code we make Things - the award-winning personal task manager.")
                Paragraph("We’ve been using Swift on server for past two years. In this talk we’ll describe our modest architecture, based on AWS.")
            },
            speakerNames: ["Vojtech Rylko"]
        ),    
        Talk(
            id: 6,
            title: "Stop worrying about routes with OpenAPI Generator",
            description: "OpenAPI specifications can be used to generate code on both the client and the server saving you time when building front-end apps and backends. In this talk, we’ll discuss how the OpenAPI generator can be used to create Swift application code from an OpenAPI spec. You’ll learn how to write an OpenAPI spec, how to use the plugin to generator client code for iOS applications and how to generate routes for a Vapor application. You’ll see how easy it is to plug everything together and quickly build a working app with networking. Finally there will be an exploration into its potential for production readiness.",
            speakerNames: ["Babeth Velghe"],
            youtubeVideoID: "n1PRYVveLd0"
        ),
        Talk(
            id: 7,
            title: "How does Server Side Swift Workout in the Real World?",
            description: ComponentGroup {
                Paragraph("In this talk, Leo Dion goes over the development of a real world Full Stack Swift application - gBeat. Enter the world of health and fitness as we learn about the process of creating, developing, and deploying of gBeat:")
                List {
                    ListItem("Building an Authentication system with Sign in with Apple")
                    ListItem("Navigating Communication with Redis and WebSockets")
                    ListItem("Migrating to async/await")
                    ListItem("Deploying to Heroku")
                    ListItem("Setting up Continuous Integration with Gitlab and Github")
                }
                Paragraph("If you are curious about what it takes and how to build your own project in Swift, you’ll definitely want to listen to this talk and see what live-streaming health app can do.")
            },
            speakerNames: ["Leo Dion"],
            youtubeVideoID: "4iB8s2fEmYc"
        ),   
        Talk(
            id: 8,
            title: "Leveraging structured concurrency in your applications",
            description: "This talk will examine the benefits of Swift’s structured concurrency and how it helps to write highly performant and maintainable code. We’ll explore the asynchronous APIs of swift-nio and swift-service-lifecycle which form the building blocks for the ecosystem. Lastly, we’ll look at common patterns and best practices for building composable libraries and applications using structured concurrency.",
            speakerNames: ["Franz Busch"],
            youtubeVideoID: "JmrnE7HUaDE"
        ),  
        Talk(
            id: 9, 
            title: "How to kickstart your journey into the backend world", 
            description: ComponentGroup {
                Paragraph("Diving into a new world can be challenging and overwhelming. For those reasons, iOS developers often choose Vapor to build their backend, staying in the Swift realm. However, there are still many things to catch up on, as building a backend is as different from building an app as it is exciting!")
                Paragraph("We’ll explore those differences with leverage and solutions, and we’ll dive into subjects like authentication, evolution, security, and tests! Get a kickstart into the backend world!")
            }, 
            speakerNames: ["Thomas Durand"],
            youtubeVideoID: "IAN0dmIAoeU"
        ),
        Talk(
            id: 10, 
            title: "Shipping a SaaS Backend Using Vapor", 
            description: ComponentGroup {
                Paragraph("I'll share my journey of building and deploying a backend for a startup that focuses on sending emails using Swift and Vapor framework. We'll go through topics you'll likely need to address to build a backend REST API, such as user authentication, analytics, error reporting, as well as using AWS products such as S3 storage, and even collecting payments using Stripe.")
                Paragraph("I hope to share a bit something interesting for everyone, especially iOS developers who are interesting in gaining more experience with server-related technologies.")
            }, 
            speakerNames: ["Petr Pavlik"],
            youtubeVideoID: "QFuZq9PHkTo"
        ),
        Talk(
            id: 11, 
            title: "So You Think You Know Swift?", 
            description: "The talk takes a deeper look at some of the common APIs in Swift to reveal lesser known features, as well as exposing underlying mechanisms such as copy-on-write or existential containers, and how they can affect both the behavior and the performance of your code.", 
            speakerNames: ["Nick Lockwood"],
            youtubeVideoID: "smkRzwANNQ8"
        ), 
        Talk(
            id: 13, 
            title: "Swift for WebAssembly", 
            description: "WebAssembly is a rapidly growing technology that provides great opportunities for Swift developers. This talk will introduce Swift developers to WebAssembly, and demonstrate how they can run Swift in the browser, call JavaScript from Swift to access the DOM, add Swift modules to web apps, and so much more. The talk concludes with a demo that shows multiple WebAssembly clients communicating with a Vapor back-end through websockets.", 
            speakerNames: ["Steven Van Impe"],
            youtubeVideoID: "cJyNok8OAuE"    
        ), 
        Talk(
            id: 14, 
            title: "Swift, Server-Side, Serverless", 
            description: ComponentGroup {
                Paragraph("Swift developers have many options to deploy their server-side code. But did you consider serverless, with no server to manage or to scale by yourself, and only paying for actual usage?")
                Paragraph("In this talk I will show you how to deploy your server-side Swift applications on AWS Lambda. I’ll start with a traditional Vapor or Hummingbird app running unmodified, then we will deploy native Swift Lambda function using the open source Lambda Swift runtime and a deployer Swift PM plugin.")
                Paragraph {
                    Text("This talk is heavily based on demo and hands-on, with minimum slides. The learning objective is to discover an alternate method to deploy server-side Swift code, with AWS Lambda. This talk is unique in two ways. First I will show how to deploy a traditional Vapor App on Lambda, without modification. Then I will show how to develop a native Swift Lambda function, ")
                    Text("and deploy it").bold()
                    Text("without having specific knowledge of AWS, just by using the open-source Swift packager and a deployer Swift PM plugins.")
                }
            },
            speakerNames: ["Sebastien Stormacq"],
            youtubeVideoID: "M1POAEPATFo"
        ),
        Talk(
            id: 15, 
            title: "Swift to the cloud in a single step", 
            description: ComponentGroup {
                Paragraph("As a server-side engineer today, it’s not enough to build a stand-alone executable for your service. You need to wrap it in a container image, ready to run on any standard public or private cloud infrastructure.")
                Paragraph("In this talk we’ll see that building a container image for your Swift project can be as quick and easy as building a native executable. Using Swift Package Manager plugins and Swift SDKs, we can extend Swift Package Manager, adding a new command tailor-made for wrapping Swift programs in container images:")
                List {
                    ListItem("Swift SDKs let us build Linux binaries directly on macOS. Builds are as fast as your native compiler, with no virtualisation overhead.")
                    ListItem("A Swift Package Manager command plugin can build any target in Package.swift, wrap it in a container and upload it to the cloud. A Dockerfile isn’t needed because the plugin already knows what to do.")
                }
                Paragraph("We’ll see how Swift SDKs can help us to build binaries for several popular Linux distributions, and even build statically-linked binaries with no runtime dependencies. We’ll take a quick look at the contents of the generated container image.Finally, we’ll show how a command plugin ties the whole process together into a single command.")
            },
            speakerNames: ["Euan Harris"],
            youtubeVideoID: "9AaINsCfZzw"
        ),
        Talk(
            id: 17, 
            title: "Introduction to Hummingbird 2", 
            description: "Hummingbird 2 is a major new framework for the Swift on Server ecosystem. It’s a feature rich, robust and performant solution, ready to implement your next server application! This talk will show you what’s new, and how it can help you build a robust and maintainable backend.",
            speakerNames: ["Joannis Orlandos"],
            youtubeVideoID: "FHO_BfidQlQ"
        ),
        Talk(
            id: 18, 
            title: "Just Save a File, It's Easy, Right?!",
            description: "Upload a photo and download a photo, it's a quick feature right? We'll go through the journey of uploading and downloading a photo to a Vapor app hosted on Heroku. Easy peasy. But is it? We'll discover the pitfalls and what we can do to improve a feature that should be simple.",
            speakerNames: ["Mikaela Caron"],
            youtubeVideoID: "lHXjs3L2ads"
        ),
        Talk(
            id: 19, 
            title: "Swift and Interopability",
            description: "A special conference keynote discussing the latest developments with Swift and Interoperability",
            speakerNames: ["Tony Parker", "Ben Cohen"],
            youtubeVideoID: "wn6C_XEv1Mo"
        ),
    ]
}
