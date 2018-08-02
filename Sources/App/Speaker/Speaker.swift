import Vapor

struct Speaker {
    let key: Speaker.Keys
    let imageUrl: String
    let name: String
    let title: String
    let company: String
    let topic: String
    let twitter: SocialMedia?
    let github: SocialMedia?

    init(
        key: Speaker.Keys,
        imageUrl: String,
        name: String,
        title: String,
        company: String,
        topic: String,
        twitter: SocialMedia? = nil,
        github: SocialMedia? = nil
    ) {
        self.key = key
        self.imageUrl = imageUrl
        self.name = name
        self.title = title
        self.company = company
        self.topic = topic
        self.twitter = twitter
        self.github = github
    }
}

/// For a new speaker profile ///

/// add new enum case with a unique string identifier
/// For example:
///
/// ```
/// enum Keys: String {
///   case tannerNelson = tanner-nelson
/// }
/// ```
///
/// this will make the following url accessible:
/// `localhost:8080/speakers/tanner-nelson`
///
///
/// Also add a new instance of that new speaker
/// For example:
///
/// ```
/// static func allSpeaker() -> [String: Speaker] {
///   return [
///     Keys.tannerNelson.rawValue:
///     Speaker(
///       key: Speaker.Keys.tannerNelson,
///       imageUrl: "/images/speakers/tanner_nelson.jpeg",
///       name: "Tanner Nelson",
///       title: "Co-Founder",
///       company: "Vapor",
///       topic: "All about Vapor and its future",
///       twitter: Twitter(url: "https://www.twitter.com/tanner0101", name: "tanner0101"),
///       github: Github(url: "https://github.com/tanner0101", name: "tanner0101")
///     )
///   ]
/// }
/// ```
///
/// this will give you the right speaker with:
/// `try req.parameters.next(Speaker.self)`
extension Speaker {
    enum Keys: String {
        case tannerNelson = "tanner-nelson"
        case jamesThomas = "james-thomas"
        case kyleJessup = "kyle-jessup"
        case johannesWeiss = "johannes-weiss"
        case ianPatridge = "ian-patridge"
        case stanislavDombrovsky = "stanislav-dombrovsky"
        case kaitlinMahar = "kaitlin-mahar"
        case kenichiUeno = "kenichi-ueno"
        case markusWyehaeuser = "markus-wyehaeuser"
        case ralphKuepper = "ralph-kuepper"
        case pimStolk = "pim-stolk"
        case marcinKliks = "marcin-kliks"
        case konradFeiler = "konrad-feiler"
    }

    static func allSpeaker() -> [Speaker] {
        return [
            Speaker(
                key: Speaker.Keys.tannerNelson,
                imageUrl: "/images/speakers/tanner_nelson.jpeg",
                name: "Tanner Nelson",
                title: "Co-Founder",
                company: "Vapor",
                topic: "All about Vapor and its future",
                twitter: Twitter(url: "https://www.twitter.com/tanner0101", name: "tanner0101"),
                github: Github(url: "https://github.com/tanner0101", name: "tanner0101")
            ),
            Speaker(
                key: Speaker.Keys.jamesThomas,
                imageUrl: "/images/speakers/james_thomas.png",
                name: "james Thomas",
                title: "Developer advocate",
                company: "IBM",
                topic: "All about Kitura and its future",
                twitter: Twitter(url: "https://twitter.com/thomasj", name: "thomasj"),
                github: Github(url: "https://github.com/jthomas", name: "jthomas")
            ),
            Speaker(
                key: Speaker.Keys.kyleJessup,
                imageUrl: "/images/speakers/kyle_jessup.jpg",
                name: "Kyle Jessup",
                title: "CTO",
                company: "Perfect",
                topic: "All about Perfect and its future",
                github: Github(url: "https://github.com/kjessup", name: "kjessup")
            ),
            Speaker(
                key: Speaker.Keys.johannesWeiss,
                imageUrl: "/images/speakers/johannes-weiss.png",
                name: "Johannes Weiss",
                title: "Software Engineer, SwiftNIO",
                company: "Apple",
                topic: "All about SwiftNIO and its future",
                twitter: Twitter(url: "https://twitter.com/johannesweiss", name: "johannesweiss"),
                github: Github(url: "https://github.com/weissi", name: "weissi")
            ),
            Speaker(
                key: Speaker.Keys.ianPatridge,
                imageUrl: "/images/speakers/ian-partridge.jpg",
                name: "Ian Partridge",
                title: "Kitura Team Lead Swift",
                company: "IBM",
                topic: "All about Kitura and its future",
                twitter: Twitter(url: "https://twitter.com/alfa", name: "alfa"),
                github: Github(url: "https://github.com/ianpartridge", name: "ianpartridge")
            ),
            Speaker(
                key: Speaker.Keys.stanislavDombrovsky,
                imageUrl: "/images/speakers/stanislav_dombrovsky.jpg",
                name: "Stanislav Dombrovsky",
                title: "AppCode PMM",
                company: "JetBrains",
                topic: "All about AppCode and its future",
                twitter: Twitter(url: "https://twitter.com/s_dombrovsky", name: "s_dombrovsky"),
                github: Github(url: "https://github.com/yeswolf", name: "yeswolf")
            ),
            Speaker(
                key: Speaker.Keys.kaitlinMahar,
                imageUrl: "/images/speakers/kaitlin-mahar.jpg",
                name: "Kaitlin Mahar",
                title: "Software Engineer",
                company: "MongoDB",
                topic: "UnsafePointer Pointers: How to Work With C Libraries in Swift",
                twitter: Twitter(url: "https://twitter.com/k__mahar", name: "k__mahar"),
                github: Github(url: "https://github.com/kmahar", name: "kmahar")
            ),
            Speaker(
                key: Speaker.Keys.kenichiUeno,
                imageUrl: "/images/speakers/kenichi_ueno.jpg",
                name: "Kenichi Ueno",
                title: "iOS Developer",
                company: "LINE Corporation",
                topic: "Experiences on how the server-side development looks like, pitfalls an iOS developer might meet and how to deploy.",
                twitter: Twitter(url: "https://twitter.com/keno42", name: "keno42"),
                github: Github(url: "https://github.com/Keno42", name: "keno42")
            ),
            Speaker(
                key: Speaker.Keys.markusWyehaeuser,
                imageUrl: "/images/speakers/markus_weyerhaeuser.jpg",
                name: "Markus Weyerhäuser",
                title: "CTO",
                company: "SEEDFUNNEL",
                topic: "From idea to market — an extremely challenging journey.",
                twitter: Twitter(url: "https://twitter.com/mweyerhaeuser", name: "mweyerhaeuser")
            ),
            Speaker(
                key: Speaker.Keys.ralphKuepper,
                imageUrl: "/images/speakers/ralph_kuepper.jpeg",
                name: "Ralph Küpper",
                title: "CEO",
                company: "Skelpo",
                topic: "Using vapor for micro services in production systems.",
                twitter: Twitter(url: "https://twitter.com/amlug", name: "amlug"),
                github: Github(url: "https://github.com/proggeramlug", name: "proggeramlug")
            ),
            Speaker(
                key: Speaker.Keys.pimStolk,
                imageUrl: "/images/speakers/pim-stolk.jpg",
                name: "Pim Stolk",
                title: "iOS Chapter Lead",
                company: "ING",
                topic: "Using Kitura in production.",
                twitter: Twitter(url: "https://twitter.com/stolkcc", name: "stolkcc"),
                github: Github(url: "https://github.com/pimstolk", name: "pimstolk")
            ),
            Speaker(
                key: Speaker.Keys.marcinKliks,
                imageUrl: "/images/speakers/marcin_kliks.jpg",
                name: "Marcin Kliks",
                title: "Devops Team Leader",
                company: "Allegro",
                topic: "Swifty microservices in production - experimenting with Swift on the server @ allegro.tech.",
                twitter: Twitter(url: "https://twitter.com/vi4m", name: "vi4m"),
                github: Github(url: "https://github.com/vi4m", name: "vi4m")
            ),
            Speaker(
                key: Speaker.Keys.konradFeiler,
                imageUrl: "/images/speakers/konrad-feiler.jpg",
                name: "Konrad Feiler",
                title: "Co-Founder",
                company: "looc.io",
                topic: "How server-side and mobile Swift can benefit from each other.",
                twitter: Twitter(url: "https://twitter.com/bersaelor", name: "bersaelor"),
                github: Github(url: "https://github.com/bersaelor", name: "bersaelor")
            )
        ]
    }
}
