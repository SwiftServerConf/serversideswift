import Plot

struct Speaker {
    let name: String
    let role: String
    let company: String?
    let url: String
    let image: String
    let twitter: String?
    let github: String?
    let mastodon: String?
    let linkedIn: String?
    let website: String?
    let bio: Component
    let talkIDs: [Int]
    
    internal init(
        name: String,
        role: String,
        company: String? = nil,
        image: String? = nil,
        twitter: String? = nil,
        github: String? = nil,
        mastodon: String? = nil,
        linkedIn: String? = nil,
        website: String? = nil,
        bio: Component,
        talkIDs: [Int]
    ) {
        self.name = name
        self.role = role
        self.company = company
        self.url = name.lowercased().replacingOccurrences(of: " ", with: "-").replacingOccurrences(of: "ö", with: "o")
        if let image {
            self.image = image
        } else {
            self.image = "/App/Images/speakers/\(name.lowercased().replacingOccurrences(of: " ", with: "-")).jpg"
        }
        self.twitter = twitter
        self.github = github
        self.mastodon = mastodon
        self.linkedIn = linkedIn
        self.website = website
        self.bio = bio
        self.talkIDs = talkIDs
    }
    
    internal init(
        name: String,
        role: String,
        company: String? = nil,
        image: String? = nil,
        twitter: String? = nil,
        github: String? = nil,
        mastodon: String? = nil,
        linkedIn: String? = nil,
        website: String? = nil,
        bio: String,
        talkIDs: [Int]
    ) {
        self.init(name: name, role: role, company: company, image: image, twitter: twitter, github: github, mastodon: mastodon, linkedIn: linkedIn, website: website, bio: Text(bio), talkIDs: talkIDs)
    }
    
    var talks: [Talk] {
        AllTalks.talks.filter {
            self.talkIDs.contains($0.id)
        }
    }
}

struct AllSpeakers {
    static let speakers: [Speaker] = [
        Speaker(
            name: "Daniel Steinberg", 
            role: "Author, Speaker and Trainer", 
            company: "Dim Sum Thinking",
            image: "/App/Images/speakers/daniel-steinberg.png",
            mastodon: "https://mastodon.social/@dimsumthinking",
            bio: ComponentGroup {
                Paragraph {
                    Text("Daniel is the author of more than a dozen books including the best selling books ")
                    Link("The Curious Case of the Async Cafe", url: "https://editorscut.com/Books/Async/bookPage.html")
                    Text(", ")
                    Link("A SwiftUI Kickstart", url: "https://editorscut.com/Books/SwiftUIKickstart/bookPage.html")
                    Text(", ")
                    Link("A Swift Kickstart", url: "https://editorscut.com/Books/SwiftKickstart/bookPage.html")
                    Text(", ")
                    Link("A Bread Baking Kickstart", url: "https://editorscut.com/Books/Bread/bookPage.html")
                    Text(", and ")
                    Link("Dear Elena", url: "https://editorscut.com/Books/DearElena/bookPage.html")
                    Text(".")
                }
                Paragraph {
                    Text("Daniel presents iOS, SwiftUI, and Swift training and consults through his company ")
                    Link("Dim Sum Thinking", url: "https://dimsumthinking.com/")
                    Text(".")
                }
                Paragraph {
                    Text("He has written apps for the iPhone and the iPad since the SDKs first appeared and has written programs for the Mac all the way back to System 7. When he's not coding or talking about coding for the Mac, the iPhone, and the iPad he's probably cooking, baking bread, or hanging out with friends.")
                }
                Paragraph {
                    Text("Information on his ")
                    Link("books and videos", url: "https://editorscut.com/")
                    Text(" is available on the ")
                    Link("Editors Cut website", url: "https://editorscut.com/")
                    Text(". Details on his ")
                    Link("training", url: "https://dimsumthinking.com/Training/index.html")
                    Text(", and ")
                    Link("speaking", url: "https://dimsumthinking.com/Speaking/index.html")
                    Text(" is on the ")
                    Link("Dim Sum Thinking website", url: "https://dimsumthinking.com/")
                    Text(".")
                }
            },
            talkIDs: [1]),
        Speaker(
            name: "Mikaela Caron",
            role: "Independent iOS Engineer",
            twitter: "https://twitter.com/mikaela__caron",
            github: "https://github.com/mikaelacaron",
            mastodon: "https://swiftdevs.space/@mikaelacaron",
            bio: "Mikaela Caron is an independent iOS Engineer who actively shares her expertise on social media, focusing on iOS development, building apps in public, and freelancing. She develops her own indie apps, works part-time as a freelancer, and is an organizer for iOSDevHappyHour. Mikaela loves giving back to the community.",
            talkIDs: [18]),
        Speaker(
            name: "Cory Benfield",
            role: "Senior Software Engineer",
            company: "Apple",
            github: "https://www.github.com/Lukasa",
            bio: "Cory is a serial open source contributor and maintainer with almost a decade of experience building, maintaining, and innovating open source networking frameworks and protocol libraries. Currently Cory is a Senior Software Engineer at Apple, putting his skills to use on high-performance networking frameworks such as SwiftNIO, Netty, and more.",
            talkIDs: [2]), 
        Speaker(
            name: "Adegboyega Olusunmade",
            role: "Founder",
            company: "Do For Love",
            twitter: "https://twitter.com/adeolusunmade",
            website: "https://www.doforlove.co",
            bio: "Founder of Do for Love a product company building exciting products",
            talkIDs: [3]), 
        Speaker(
            name: "Tibor Bödecs",
            role: "CEO",
            company: "Binary Birds",
            image: "/App/Images/speakers/tibor-bodecs.jpg",
            twitter: "http://twitter.com/tiborbodecs",
            website: "http://binarybirds.com/",
            bio: "Tibor Bödecs is a seasoned software developer specializing in Swift on the server and backend technologies. He is the author of the popular book “Practical Server Side Swift,” which provides a comprehensive guide to the Vapor framework. Currently, Tibor is the CEO of Binary Birds, a company dedicated to server-side Swift development and consulting. As a member of the Swift Server Workgroup (SSWG), he regularly publishes insightful articles on swiftonserver.com, collaborating with fellow SSWG member Joannis Orlandos. Outside of work, Tibor loves metal music, plays the guitar, and has a passion for traveling, especially exploring Southeast Asia.",
            talkIDs: [4]), 
        Speaker(
            name: "Babeth Velghe",
            role: "Student",
            bio: "A student with a passion for coding, who recently delved into Swift programming. For her bachelor thesis, she explored the Swift OpenAPI Generator.",
            talkIDs: [6]), 
        Speaker(
            name: "Franz Busch",
            role: "Software Engineer",
            company: "Apple",
            twitter: "http://twitter.com/FranzJBusch",
            bio: "Franz is a member of a team developing foundational Swift libraries at Apple primarily focused on networking and concurrency. Franz is also a member of the Swift Server working group. Before joining Apple, Franz spent a decade working in the mobile applications space.",
            talkIDs: [8]),
        Speaker(
            name: "Thomas Durand",
            role: "Indie iOS Developer",
            twitter: "http://twitter.com/deanatoire",
            website: "https://thomasdurand.fr/",
            bio: "I like to go by the name of Dean, because it’s way easier to pronounce in any language, including English than “Thomas Durand” Backend architect and security engineer by day, I’m also an iOS Indie Dev by night! On my free time, I’m building in public independent iOS app like SharePal and Padlok. I also share my discoveries while building on my blog, mostly about Swift, SwiftUI and software security. After a first talk at NSSpain XI, I’d like to continue growing in the community, sharing everything I learn along my journey of building indie apps, or reliable and scalable back-ends.",
            talkIDs: [9]),
        Speaker(
            name: "Petr Pavlik",
            role: "Staff software enginner",
            twitter: "http://twitter.com/ptrpavlik",
            bio: "Coming from iOS dev background, I've been a fan, and an occasional contributor, since the very beginning of Swift on the server. Guess I'm one of not that many who can say that they've tried all major versions of Vapor over the years.",
            talkIDs: [10]),
        Speaker(
            name: "Nick Lockwood",
            role: "iOS Developer",
            twitter: "http://twitter.com/nicklockwood",
            github: "https://github.com/nicklockwood",
            bio: "Nick is a veteran iOS developer, author and open sourcerer with a career spanning 20 years in software engineering",
            talkIDs: [11]),
        Speaker(
            name: "Leo Dion",
            role: "Founder",
            company: "BrightDigit",
            twitter: "http://twitter.com/leogdion",
            website: "https://brightdigit.com/",
            bio: ComponentGroup {
                Paragraph {
                    Text("Leo Dion runs ")
                    Link("BrightDigit", url: "https://brightdigit.com/")
                    Text(", a company which specializes in software development in the Apple space: iOS, macOS, and watchOS as well as server-side. He has over 10 years of experience developing in iOS and has been developing in, blogging about and speaking about Swift since day 1. He lives in Michigan with his wife Betsy and 6 adorable kids. If you want to check out more content he currently runs ")
                    Link("empowerapps.show", url: "https://empowerapps.show/")
                    Text(", a bi-weekly podcast on Apple stuff, Swift and business as well as his ")
                    Link("other talks here", url: "https://www.youtube.com/watch?v=WVXvIso24Sc&list=PLmpJxPaZbSnBTtrr4V6bksOfLVK4uK9q6")
                    Text(".")
                }
            },
            talkIDs: [7]), 
        Speaker(
            name: "Sebastien Stormacq", 
            role: "Developer Advocate", 
            company: "AWS",
            twitter: "http://twitter.com/sebsto",
            linkedIn: "https://www.linkedin.com/in/sebastienstormacq/",
            website: "https://stormacq.com/",
            bio: ComponentGroup {
                Paragraph {
                    Text("Seb is Developer Advocate at AWS and member of the Swift Server Working Group. He is a ")
                    Link("regular speaker at conferences", url: "https://www.youtube.com/playlist?list=PLZ_TUMnTqfu807CK1WZis4h89umhDapCE")
                    Text(", a ")
                    Link("prolific author on the AWS News Blog", url: "https://aws.amazon.com/blogs/aws/author/stormacq/")
                    Text(", and a ")
                    Link("podcast producer", url: "https://aws.amazon.com/fr/blogs/france/podcasts/")
                    Text(".")
                }
            },
            talkIDs: [14]),
        Speaker(
            name: "Steven Van Impe",
            role: "Lecturer",
            company: "HOGENT University of Applied Sciences",
            twitter: "http://twitter.com/pwsacademy",
            website: "https://www.pwsacademy.org/",
            bio: "Steven has been teaching Swift professionally since 2014. He is an active member of the open source community, focusing on anything that supports Swift as a general purpose cross-platform language.",
            talkIDs: [13]),
        Speaker(
            name: "Vojtech Rylko",
            role: "Software Engineer",
            company: "Cultured Code",
            website: "https://culturedcode.com/things/",
            bio: "Software engineer at Cultured Code responsible for Things Cloud and sync architecture.",
            talkIDs: [5]),
        Speaker(
            name: "Joannis Orlandos",
            role: "Founder",
            company: "Unbeatable Software",
            twitter: "https://x.com/joannisorlandos",
            github: "https://www.github.com/joannis",
            mastodon: "https://fosstodon.org/@joannis",
            website: "https://unbeatable.software",
            bio: "SSWG Member, Maintainer for MongoKitten, Hummingbird, Vapor and 20 other libs.",
            talkIDs: [17]), 
        Speaker(
            name: "Euan Harris",
            role: "Software Engineer",
            company: "Apple",
            bio: "Euan builds cloud services and infrastructure using Swift at Apple. He enjoys working with containers, virtual machines, networks and interesting programming languages. Previously, Euan helped maintain Docker Swarm’s overlay networking and HTTP ingress and contributed to XenServer’s open-source XenAPI control plane, the Xen hypervisor and OpenStack.",
            talkIDs: [15]), 
        Speaker(
            name: "Tony Parker",
            role: "Manager",
            company: "Apple",
            bio: "Tony Parker is a manager on the Swift team at Apple, where his responsibilities include the Swift Standard Library, Foundation, and other low level Swift packages. He started working on Foundation 17 years ago, and has seen it through countless releases, ports, and transitions. He is passionate about great API design and helping other developers to create their best apps.",
            talkIDs: [19]), 
        Speaker(
            name: "Ben Cohen",
            role: "Manager",
            company: "Apple",
            bio: "Ben is a manager on the Swift team at Apple.",
            talkIDs: [19]), 
    ]
}


