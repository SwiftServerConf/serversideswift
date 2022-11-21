import Plot

struct Speaker {
    let name: String
    let role: String
    let company: String
    let url: String
    let image: String
    let twitter: String?
    let github: String?
    let bio: Component
    let talkIDs: [Int]
    
    internal init(
        name: String,
        role: String,
        company: String,
        twitter: String? = nil,
        github: String? = nil,
        bio: Component,
        talkIDs: [Int]
    ) {
        self.name = name
        self.role = role
        self.company = company
        self.url = name.lowercased().replacingOccurrences(of: " ", with: "-")
        self.image = "/App/Images/speakers/\(name.lowercased().replacingOccurrences(of: " ", with: "-")).jpg"
        self.twitter = twitter
        self.github = github
        self.bio = bio
        self.talkIDs = talkIDs
    }
    
    internal init(
        name: String,
        role: String,
        company: String,
        twitter: String? = nil,
        github: String? = nil,
        bio: String,
        talkIDs: [Int]
    ) {
        self.name = name
        self.role = role
        self.company = company
        self.url = name.lowercased().replacingOccurrences(of: " ", with: "-")
        self.image = "/App/Images/speakers/\(name.lowercased().replacingOccurrences(of: " ", with: "-")).jpg"
        self.twitter = twitter
        self.github = github
        self.bio = Text(bio)
        self.talkIDs = talkIDs
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
            name: "Mikaela Caron",
            role: "iOS Engineer",
            company: "Lickability",
            twitter: "https://twitter.com/mikaela__caron",
            github: "https://github.com/mikaelacaron",
            bio: "Mikaela Caron is an iOS Engineer at Lickability. She’s a self-taught developer, and transitioned into the tech industry from manufacturing. She creates content on YouTube, Instagram, and Twitter, sharing her knowledge about iOS development, daily life of a developer, and freelancing. She freelances part-time building iOS apps and her own indie apps. The first two apps she created were shared on her Instagram story, in her story highlights, showing how an app is built from sketch to published on the App Store. She is an organizer for iOSDevHappyHour and loves giving back to the community.",
            talkIDs: []),
        Speaker(
            name: "Matias Piipari",
            role: "Engineering Director",
            company: "Canonical",
            twitter: "https://twitter.com/mz2",
            github: "https://github.com/mz2",
            bio: "My name is Matias Piipari and I am an Engineering Director at Canonical, distributors of Ubuntu Linux. At Canonical I oversee distributed system testing of our Kubernetes and OpenStack based Cloud solutions and our varied hardware certification programs for devices ranging from data centre grade servers to tiny IoT devices. Before Canonical, I have over a decade of development experience on macOS and iOS as CTO of the Apple Design Award winning Papersapp.com, later as creator of the Mac based Manuscripts authoring tool acquired by Wiley & Sons, and most recently as Engineering Manager at the ADA winning Sketch. Even as my current role is Linux focused, I continue to build Mac and iOS based apps on my own time, and track the development of Swift as a language, and Swift based technologies.",
            talkIDs: [1]),
        Speaker(
            name: "Simon Pilkington",
            role: "Senior Software Engineer",
            company: "Prime Video",
            twitter: "https://twitter.com/tachyonics",
            github: "https://github.com/tachyonics",
            bio: "Senior Software Engineer at Prime Video and member of the SSWG",
            talkIDs: [2]),
        Speaker(
            name: "Ellen Shapiro",
            role: "Native Mobile Developer",
            company: "Gusto",
            twitter: "https://twitter.com/DesignatedNerd",
            github: "https://github.com/DesignatedNerd",
            bio: "Ellen Shapiro is a native mobile developer currently working at Gusto (the US payroll/HR one, not the UK food delivery one). She's built iOS and Android apps and SDKs for the last decade, including for SpotHero and Apollo GraphQL. She enjoys kayaking, music, laser woodworking, and complaining about the cold. She lives in Madison, Wisconsin with her wife and two cats.",
            talkIDs: []),
        Speaker(
            name: "Cory Benfield",
            role: "Senior Software Engineer",
            company: "Apple",
            twitter: "https://www.twitter.com/Lukasaoz",
            github: "https://www.github.com/Lukasa",
            bio: "Cory is a serial open source contributor and maintainer with almost a decade of experience building, maintaining, and innovating open source networking frameworks and protocol libraries. He's spent time as a core contributor or lead maintainer on a number of Python HTTP libraries and networking frameworks, including Requests, Hyper, and Twisted. Currently Cory is a Senior Software Engineer at Apple, putting his skills to use on high-performance networking frameworks such as SwiftNIO, Netty, and more.",
            talkIDs: [3]),
        Speaker(
            name: "Johannes Weiss",
            role: "Senior Software Engineer",
            company: "Apple",
            twitter: "https://www.twitter.com/johannesweiss",
            github: "https://www.github.com/weissi",
            bio: "Johannes likes low-level problems and high-level languages. He strives to reduce complexity and increase performance to enable beautiful, fast and correct programs.",
            talkIDs: [4]),
        Speaker(
            name: "Andrew Barba",
            role: "Founder",
            company: "Swift Cloud",
            bio: "Founder of Swift Cloud",
            talkIDs: [5])
        
    ]
    
    static let lightningSpeakers: [Speaker] = [
        Speaker(
            name: "Dave Verwer",
            role: "Co-Founder",
            company: "Swift Package Index",
            twitter: "https://twitter.com/daveverwer",
            github: "https://github.com/daveverwer",
            bio: ComponentGroup {
                Text("Dave is a independent and freelance writer and iOS developer. He is the creator of ")
                Link("iOS Dev Weekly", url: "https://iosdevweekly.com")
                Text(" and co-founder of the ")
                Link("Swift Package Index", url: "https://swiftpackageindex.com")
                Text(". He has been developing for the Mac and iOS since 2006 and is secretly quite proud that his first professional gig had him using a (real) vt100 green screen terminal. He's glad he doesn't have to use that any more though! If you'd like to learn more about Dave, visit his ")
                Link("personal site", url: "https://daveverwer.com")
                Text(".")
            },
            talkIDs: [6]),
        Speaker(
            name: "Joannis Orlandos",
            role: "Founder",
            company: "Responsive Software",
            twitter: "https://twitter.com/joannisorlandos",
            github: "https://github.com/joannis",
            bio: "Previously Vapor core-team member, designer of Vapor 3 and still maintains over 20 Vapor related libraries. Joannis enjoys low-level software development, and is a strong advocate for reducing code complexity through well designed software.",
            talkIDs: [7]),
        Speaker(
            name: "Firas Safa",
            role: "iOS Engineer",
            company: "The Inked Engineer",
            github: "https://github.com/TheInkedEngineer",
            bio: "iOS Engineer, server-side-swift lover and design enthusiast | I love building things, writing articles, gaming and music | I go by `TheInkedEngineer`. | Based in Milan, originally from Lebanon.",
            talkIDs: []),
        Speaker(
            name: "Georg Tuparev",
            role: "Founder",
            company: "Tuparev Technologies",
            twitter: "https://twitter.com/tuparev",
            github: "https://github.com/tuparev",
            bio: "Since Georg bought his first NeXTstation in 1991 he got hooked on any NeXT and later - Apple, technology. Early adopter of the revolutionary for its time Enterprise Objects Framework (EOF) and later WebObjects, he is the principle developer of dozens of server-side applications for health care, finance, banking, large knowledge repositories, and science and laboratory systems. Currently his company (Tuparev Technologies) is involved in one of the largest financial and banking systems in The Netherlands and is working on an extremely complex system for detecting and monitoring space debris (space junk), and an early satellite collision warning system for ESA and other space agencies.",
            talkIDs: [8])
    ]
}


