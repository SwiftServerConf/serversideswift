import Vapor

struct Speaker {
    let name: String
    let title: String
    let company: String
    let twitter: String?
    let github: String?
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
                name: "Tanner Nelson",
                title: "Co-Founder",
                company: "Vapor",
                twitter: "https://www.twitter.com/tanner0101",
                github: nil
            )
        ]
    }
}
