import Vapor

struct Speaker {
    let imageUrl: String
    let name: String
    let title: String
    let company: String
    let topic: String
    let twitter: SocialMedia?
    let github: SocialMedia?
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
///       name: "Tanner Nelson",
///       title: "Co-Founder",
///       company: "Vapor",
///       twitter: "https://www.twitter.com/tanner0101",
///       github: nil
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
    }

    static func allSpeaker() -> [String: Speaker] {
        return [
            Keys.tannerNelson.rawValue:
            Speaker(
                imageUrl: "/images/speakers/tanner_nelson.jpeg",
                name: "Tanner Nelson",
                title: "Co-Founder",
                company: "Vapor",
                topic: "All about Vapor and its future",
                twitter: Twitter(url: "https://www.twitter.com/tanner0101", name: "tanner0101"),
                github: Github(url: "https://github.com/tanner0101", name: "tanner0101")
            )
        ]
    }
}
