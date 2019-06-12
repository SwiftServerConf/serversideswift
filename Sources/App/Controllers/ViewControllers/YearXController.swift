import Vapor
import Fluent

struct YearXController: RouteCollection {
    func boot(router: Router) throws {
        router.get(use: homepageHandler)
        router.get("speakers", use: speakersHandler)
        router.get("location", use: locationHandler)
        router.get("sponsors", use: sponsorsHandler)
        router.get("faq", use: faqHandler)
        router.get("about", use: aboutHandler)
        router.get("coc", use: codeOfConductHandler)
        router.get("speakers", String.parameter, use: speakerProfileHanlder)
        router.get("years", use: yearsHandler)
        router.get("tickets", use: ticketsHandler)
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
        let eventRepo = try req.make(EventRepository.self)
        let speakerRepo = try req.make(SpeakerRepository.self)

        return eventRepo
            .find(slug: "2019", enabled: true)
            .flatMap(to: [(Speaker, Talk)].self) { event in
                guard let event = event else { throw Abort(.internalServerError) }
                return try speakerRepo.all(event: event, enabled: true)
            }
            .map(to: [Speaker].self) { speakers in
                return speakers.map { $0.0 }
            }
            .flatMap { speakers in
                let context = SpeakerContext(speakerList: speakers)
                return try req.view().render("App/YearX/Pages/Speakers/speakers", context)
            }
    }

    func locationHandler(_ req: Request) throws -> Future<View> {
        let locationContext = LocationContext()
        return try req.view().render("App/YearX/Pages/Location/location", locationContext)
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
  
    func speakerProfileHanlder(_ req: Request) throws -> Future<View> {
        let speakerSlug = try req.parameters.next(String.self)
        return try Speaker.resolveParameter(speakerSlug, on: req).flatMap { speaker in
            let context = SpeakerProfileContext(speaker: speaker)
            return try req.view().render("App/YearX/Pages/Speakers/profile", context)
        }
    }
    
    func yearsHandler(_ req: Request) throws -> Future<View> {
        let context = YearContext()
        return try req.view().render("App/YearX/Pages/Years/years", context)
    }

    func ticketsHandler(_ req: Request) throws -> Future<View> {
        let ticketsContext = TicketsContext()
        return try req.view().render("App/YearX/Pages/Tickets/tickets", ticketsContext)
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

struct SpeakerProfileContext: Encodable {
    let page = ["speakers": true]
    let speaker: Speaker
}

struct LocationContext: Encodable {
    let page = ["location": true]
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

struct YearContext: Encodable {
    let page = ["years": true]
    let yearList: [Year] = [
        Year(number: 2019, isCurrent: true),
        Year(number: 2018)
    ]
    
    struct Year: Encodable {
        let number: Int
        var isCurrent: Bool
        
        init(number: Int, isCurrent: Bool = false) {
            self.number = number
            self.isCurrent = isCurrent
        }
    }
}

struct TicketsContext: Encodable {
    let page = ["tickets": true]
}
