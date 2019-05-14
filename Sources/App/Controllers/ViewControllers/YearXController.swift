import Vapor
import Fluent

struct YearXController: RouteCollection {
    func boot(router: Router) throws {
        router.get(use: homepageHandler)
        router.get("speakers", use: speakersHandler)
        router.get("sponsors", use: sponsorsHandler)
        router.get("faq", use: faqHandler)
        router.get("about", use: aboutHandler)
        router.get("code-of-conduct", use: codeOfConductHandler)
    }

    func homepageHandler(_ req: Request) throws -> Future<View> {
        let homeContext = HomeContext()
        return try req.view().render("App/YearX/Pages/Home/home", homeContext)
    }
  
    func aboutHandler(_ req: Request) throws -> Future<View> {
        let aboutContext = AboutContext()
        return try req.view().render("App/YearX/Pages/About/about", aboutContext)
    }
  
    func speakersHandler(_ req: Request) throws -> Future<View> {
        let speakerSlugs = ["kaitlin-mahar"]
        return Speaker.query(on: req).filter(\Speaker.slug ~~ speakerSlugs).all().flatMap { speakerList in
          let speakerContext = SpeakerContext(speakerList: speakerList)
          return try req.view().render("App/YearX/Pages/Speaker/speaker", speakerContext)
        }
    }
  
    func sponsorsHandler(_ req: Request) throws -> Future<View> {
        let sponsorsContext = SponsorsContext()
        return try req.view().render("App/YearX/Pages/Sponsors/sponsors", sponsorsContext)
    }

    func faqHandler(_ req: Request) throws -> Future<View> {
        let faqContext = FaqContext()
        return try req.view().render("App/YearX/Pages/FAQ/faq", faqContext)
    }

    func codeOfConductHandler(_ req: Request) throws -> Future<View> {
        let cocContext = CodeOfConductContext()
        return try req.view().render("App/YearX/Pages/CodeOfConduct/code-of-conduct", cocContext)
    }
}

struct HomeContext: Encodable {
    let page = ["home": true]
}

struct AboutContext: Encodable {
    let page = ["about": true]
}

struct SpeakerContext: Encodable {
    let page = ["speakers": true]
    let speakerList: [Speaker]
}

struct SponsorsContext: Encodable {
  let page = ["sponsors": true]
}

struct FaqContext: Encodable {
    let page = ["faq": true]
}

struct CodeOfConductContext: Encodable {
    let page = ["code-of-conduct": true]
}
