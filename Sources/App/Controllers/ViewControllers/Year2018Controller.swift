import Vapor
import Fluent

struct Year2018Controller: RouteCollection {
    func boot(router: Router) throws {
        router.get(use: homepageHandler)
        router.get("videos", use: videosHandler)
        router.get("photos", use: photosHandler)
        router.get("speakers", use: allSpeakersHandler)
        router.get("speakers", Speaker.parameter, use: speakerHandler)
        router.get("schedule", use: scheduleHandler)
        router.get("location", use: locationHandler)
        router.get("sponsors", use: sponsorsHandler)
        router.get("faq", use: faqHandler)
        router.get("about", use: aboutHandler)
        router.get("code-of-conduct", use: codeOfConductHandler)
        router.get("tickets", use: ticketsHandler)
    }
    
    func homepageHandler(_ req: Request) throws -> Future<View> {
        return try req.view().render("App/Year2018/Pages/home", ["home": true])
    }
    
    func videosHandler(_ req: Request) throws -> Future<View> {
        struct VideosContext: Encodable {
            let data: [TalkAndSpeaker]
            let videos: Bool = true
        }
        let eventRepo = try req.make(EventRepository.self)
        let speakerRepo = try req.make(SpeakerRepository.self)

        return eventRepo
            .find(slug: "2018", enabled: true)
            .flatMap { event -> Future<[(Speaker, [Talk])]> in
                guard let event = event else { throw Abort(.internalServerError) }
                return try speakerRepo.all(event: event, enabled: true)
            }
            .map { speakers in
                return speakers.map { TalkAndSpeaker(speaker: $0.0, talks: $0.1)}
            }
            .flatMap { speakers in
                let context = VideosContext(data: speakers)
                return try req.view().render("App/Year2018/Pages/videos", context)
            }

    }
    
    func photosHandler(_ req: Request) throws -> Future<View> {
        struct PhotosContext: Encodable {
            let photos = [
                "/App/Year2018/images/photos/day_two_732.JPG",
                "/App/Year2018/images/photos/day_one_2.JPG",
                "/App/Year2018/images/photos/day_one_8.JPG",
                "/App/Year2018/images/photos/day_one_37.JPG",
                "/App/Year2018/images/photos/day_one_55.JPG",
                "/App/Year2018/images/photos/day_two_70.JPG",
                "/App/Year2018/images/photos/day_two_122.JPG",
                "/App/Year2018/images/photos/day_two_154.JPG",
                "/App/Year2018/images/photos/day_two_226.JPG",
                "/App/Year2018/images/photos/day_two_251.JPG",
                "/App/Year2018/images/photos/day_two_278.JPG",
                "/App/Year2018/images/photos/day_two_291.JPG",
                "/App/Year2018/images/photos/day_two_302.JPG",
                "/App/Year2018/images/photos/day_two_375.JPG",
                "/App/Year2018/images/photos/day_two_450.JPG",
                "/App/Year2018/images/photos/day_two_515.JPG",
                "/App/Year2018/images/photos/day_two_565.JPG",
                "/App/Year2018/images/photos/day_two_593.JPG",
                "/App/Year2018/images/photos/day_two_610.JPG",
                "/App/Year2018/images/photos/day_two_680.JPG",
                "/App/Year2018/images/photos/day_two_686.JPG",
                "/App/Year2018/images/photos/day_two_704.JPG",
                "/App/Year2018/images/photos/day_two_768.JPG",
                "/App/Year2018/images/photos/day_two_814.JPG",
                "/App/Year2018/images/photos/day_two_819.JPG",
                "/App/Year2018/images/photos/day_three_8.JPG",
                "/App/Year2018/images/photos/day_three_13.JPG",
                "/App/Year2018/images/photos/day_three_21.JPG",
                "/App/Year2018/images/photos/day_three_27.JPG",
                "/App/Year2018/images/photos/day_three_39.JPG",
                "/App/Year2018/images/photos/day_three_43.JPG",
                "/App/Year2018/images/photos/day_three_69.JPG",
                "/App/Year2018/images/photos/day_three_81.JPG",
                "/App/Year2018/images/photos/day_three_134.JPG",
                "/App/Year2018/images/photos/day_three_169.JPG",
                "/App/Year2018/images/photos/day_three_229.JPG",
                "/App/Year2018/images/photos/day_three_246.JPG",
                "/App/Year2018/images/photos/day_three_280.JPG",
                "/App/Year2018/images/photos/day_three_303.JPG",
                "/App/Year2018/images/photos/day_three_324.JPG",
                "/App/Year2018/images/photos/day_three_337.JPG"
            ]
        }
        let context = PhotosContext()
        return try req.view().render("App/Year2018/Pages/photos", context)
    }
    
    func allSpeakersHandler(_ req: Request) throws -> Future<View> {
        struct SpeakersContext: Encodable {
            let data: [Speaker]
            let speakers: Bool = true
        }

        let eventRepo = try req.make(EventRepository.self)
        let speakerRepo = try req.make(SpeakerRepository.self)

        return eventRepo
            .find(slug: "2018", enabled: true)
            .flatMap(to: [(Speaker, [Talk])].self) { event in
                guard let event = event else { throw Abort(.internalServerError) }
                return try speakerRepo.all(event: event, enabled: true)
            }
            .map(to: [Speaker].self) { speakers in
                return speakers.map { $0.0 }
            }
            .flatMap { speakers in
                let context = SpeakersContext(data: speakers)
                return try req.view().render("App/Year2018/Pages/speakers", context)
            }
    }
    
    func speakerHandler(_ req: Request) throws -> Future<View> {
        struct SpeakerContext: Encodable {
            let data: TalkAndSpeaker
            let speakers: Bool = true
        }

        let talkRepo = try req.make(TalkRepository.self)
        let eventRepo = try req.make(EventRepository.self)

        return try req.parameters.next(Speaker.self)
            .and(eventRepo.find(slug: "2018", enabled: true))
            .flatMap { speaker, event in
                guard let event = event else { throw Abort(.internalServerError) }
                return try talkRepo.all(speaker: speaker, event: event, enabled: true)
            .flatMap { talks in
                // Assuming 1 talk per speaker
                let context = SpeakerContext(data: TalkAndSpeaker(speaker: speaker, talks: talks))
                return try req.view().render("App/Year2018/Pages/speaker-profile", context)
            }
        }
    }
    
    func scheduleHandler(_ req: Request) throws -> Future<View> {
        return try req.view().render("App/Year2018/Pages/schedule", ["schedule": true])
    }
    
    func locationHandler(_ req: Request) throws -> Future<View> {
        return try req.view().render("App/Year2018/Pages/location", ["location": true])
    }
    
    func sponsorsHandler(_ req: Request) throws -> Future<View> {
        return try req.view().render("App/Year2018/Pages/sponsors", ["sponsors": true])
    }

    func faqHandler(_ req: Request) throws -> Future<View> {
        return try req.view().render("App/Year2018/Pages/faq", ["faq": true])
    }

    func aboutHandler(_ req: Request) throws -> Future<View> {
        return try req.view().render("App/Year2018/Pages/about", ["about": true])
    }

    func codeOfConductHandler(_ req: Request) throws -> Future<View> {
        return try req.view().render("App/Year2018/Pages/code-of-conduct", ["about": true])
    }

    func ticketsHandler(_ req: Request) throws -> Future<View> {
        return try req.view().render("App/Year2018/Pages/tickets", ["tickets": true])
    }
}

struct TalkAndSpeaker: Encodable {
    let speaker: Speaker
    let talks: [Talk]
}
