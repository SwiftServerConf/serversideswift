import Plot

struct Speaker {
    let name: String
    let role: String
    let company: String
    let url: String
    let image: String
    let twitter: String?
    let github: String?
    let mastodon: String?
    let bio: Component
    let talkIDs: [Int]
    
    internal init(
        name: String,
        role: String,
        company: String,
        image: String? = nil,
        twitter: String? = nil,
        github: String? = nil,
        mastodon: String? = nil,
        bio: Component,
        talkIDs: [Int]
    ) {
        self.name = name
        self.role = role
        self.company = company
        self.url = name.lowercased().replacingOccurrences(of: " ", with: "-")
        if let image {
            self.image = image
        } else {
            self.image = "/App/Images/speakers/\(name.lowercased().replacingOccurrences(of: " ", with: "-")).jpg"
        }
        self.twitter = twitter
        self.github = github
        self.mastodon = mastodon
        self.bio = bio
        self.talkIDs = talkIDs
    }
    
    internal init(
        name: String,
        role: String,
        company: String,
        image: String? = nil,
        twitter: String? = nil,
        github: String? = nil,
        mastodon: String? = nil,
        bio: String,
        talkIDs: [Int]
    ) {
        self.init(name: name, role: role, company: company, image: image, twitter: twitter, github: github, mastodon: mastodon, bio: Text(bio), talkIDs: talkIDs)
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
                    Text("Daniel presents iOS, SwiftUI, and Swift training and consults through his company")
                    Link("Dim Sum Thinking", url: "https://dimsumthinking.com/")
                    Text(".")
                }
                Paragraph {
                    Text("He has written apps for the iPhone and the iPad since the SDKs first appeared and has written programs for the Mac all the way back to System 7. When he's not coding or talking about coding for the Mac, the iPhone, and the iPad he's probably cooking, baking bread, or hanging out with friends.")
                }
                Paragraph {
                    Text("Information on his ")
                    Link("books and videos", url: "https://editorscut.com/")
                    Text(" is available on the")
                    Link("Editors Cut website", url: "https://editorscut.com/")
                    Text(". Details on his ")
                    Link("training", url: "https://dimsumthinking.com/Training/index.html")
                    Text(", and ")
                    Link("speaking", url: "https://dimsumthinking.com/Speaking/index.html")
                    Text(" is on the")
                    Link("Dim Sum Thinking website", url: "https://dimsumthinking.com/")
                    Text(".")
                }
            },
            talkIDs: [1]),
        Speaker(
            name: "Mikaela Caron",
            role: "iOS Engineer",
            company: "Lickability",
            twitter: "https://twitter.com/mikaela__caron",
            github: "https://github.com/mikaelacaron",
            mastodon: "https://swiftdevs.space/@mikaelacaron",
            bio: "Mikaela Caron is an iOS Engineer at Lickability. She’s a self-taught developer, and transitioned into the tech industry from manufacturing. She creates content on YouTube, Instagram, and Twitter, sharing her knowledge about iOS development, daily life of a developer, and freelancing. She freelances part-time building iOS apps and her own indie apps. The first two apps she created were shared on her Instagram story, in her story highlights, showing how an app is built from sketch to published on the App Store. She is an organizer for iOSDevHappyHour and loves giving back to the community.",
            talkIDs: []),        
    ]
    
    static let lightningSpeakers: [Speaker] = [
        // Speaker(
        //     name: "Dave Verwer",
        //     role: "Co-Founder",
        //     company: "Swift Package Index",
        //     twitter: "https://twitter.com/daveverwer",
        //     github: "https://github.com/daveverwer",
        //     bio: ComponentGroup {
        //         Text("Dave is a independent and freelance writer and iOS developer. He is the creator of ")
        //         Link("iOS Dev Weekly", url: "https://iosdevweekly.com")
        //         Text(" and co-founder of the ")
        //         Link("Swift Package Index", url: "https://swiftpackageindex.com")
        //         Text(". He has been developing for the Mac and iOS since 2006 and is secretly quite proud that his first professional gig had him using a (real) vt100 green screen terminal. He's glad he doesn't have to use that any more though! If you'd like to learn more about Dave, visit his ")
        //         Link("personal site", url: "https://daveverwer.com")
        //         Text(".")
        //     },
        //     talkIDs: [6]),
        // Speaker(
        //     name: "Joannis Orlandos",
        //     role: "Founder",
        //     company: "Responsive Software",
        //     twitter: "https://twitter.com/joannisorlandos",
        //     github: "https://github.com/joannis",
        //     bio: "Previously Vapor core-team member, designer of Vapor 3 and still maintains over 20 Vapor related libraries. Joannis enjoys low-level software development, and is a strong advocate for reducing code complexity through well designed software.",
        //     talkIDs: [7]),
        // Speaker(
        //     name: "Firas Safa",
        //     role: "iOS Engineer",
        //     company: "TrueLayer",
        //     github: "https://github.com/TheInkedEngineer",
        //     bio: "iOS Engineer, server-side-swift lover and design enthusiast | I love building things, writing articles, gaming and music | I go by `TheInkedEngineer`. | Based in Milan, originally from Lebanon.",
        //     talkIDs: [11]),
        // Speaker(
        //     name: "Georg Tuparev",
        //     role: "Founder",
        //     company: "Tuparev Technologies",
        //     twitter: "https://twitter.com/tuparev",
        //     github: "https://github.com/tuparev",
        //     bio: "Since Georg bought his first NeXTstation in 1991 he got hooked on any NeXT and later - Apple, technology. Early adopter of the revolutionary for its time Enterprise Objects Framework (EOF) and later WebObjects, he is the principle developer of dozens of server-side applications for health care, finance, banking, large knowledge repositories, and science and laboratory systems. Currently his company (Tuparev Technologies) is involved in one of the largest financial and banking systems in The Netherlands and is working on an extremely complex system for detecting and monitoring space debris (space junk), and an early satellite collision warning system for ESA and other space agencies.",
        //     talkIDs: [8]),
        // Speaker(
        //     name: "Andrea Scuderi",
        //     role: "Senior iOS Engineer",
        //     company: "JustEatTakeaway.com",
        //     twitter: "https://twitter.com/andreascuderi13",
        //     github: "https://github.com/swift-sprinter/aws-serverless-swift-api-template",
        //     bio: "Andrea is a Senior Engineer iOS @JustEat Takeaway with experience in the Marketplaces, Retail, Finance, Banking, Energy and Media industries. He is the creator of Swift-Sprinter an open-source library to work with Swift on AWS Lambda, ClippingCamera and  Trackyzer an app for Cyclists.",
        //     talkIDs: [10]),
        // Speaker(
        //     name: "Dorian Grolaux",
        //     role: "iOS Engineer",
        //     company: "data.ai",
        //     twitter: "https://twitter.com/MrSkwiggs",
        //     github: "https://github.com/MrSkwiggs",
        //     bio: ComponentGroup {
        //         Paragraph("I'm an iOS Engineer currently working at data.ai, have been in the field for the past 7 years and really, just love Swift!")
        //         Paragraph {
        //             Text("I've kept a close eye on Vapor for years now, because I'm really into server-side tech, but never really had any projects where I could explore it. Until iOS support was implemented, then I started working on a camera-streaming app which is currently in development but about to release soon (Testflight here, if you'd like to see for yourself: ")
        //             Link("https://testflight.apple.com/join/G2nWjlsH", url: "https://testflight.apple.com/join/G2nWjlsH")
        //             Text(")")
        //         }
        //     },
        //     talkIDs: [9])
    ]
}


