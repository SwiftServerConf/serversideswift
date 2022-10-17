struct Speaker {
    let name: String
    let role: String
    let company: String
    let url: String
    let image: String
    let twitter: String?
    let github: String?
    let bio: String
    let talkIDs: [Int]
    
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
        self.bio = bio
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
            talkIDs: [])
    ]
}


