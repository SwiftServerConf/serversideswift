import Vapor
import Fluent

struct YearXController: RouteCollection {
    func boot(router: Router) throws {
        router.get(use: homepageHandler)
        router.get("speakers", use: speakersHandler)
        router.get("schedule", use: scheduleHandler)
        router.get("location", use: locationHandler)
        router.get("sponsors", use: sponsorsHandler)
        router.get("faq", use: faqHandler)
        router.get("about", use: aboutHandler)
        router.get("code-of-conduct", use: codeOfConductHandler)
        router.get("speakers", String.parameter, use: speakerProfileHandler)
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
            .flatMap(to: [(Speaker, [Talk])].self) { event in
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

    func scheduleHandler(_ req: Request) throws -> Future<View> {
        let eventRepo = try req.make(EventRepository.self)
        let dayRepo = try req.make(DayRepository.self)
        let scheduleEntryRepo = try req.make(ScheduleEntryRepository.self)
        let speakerRepo = try req.make(SpeakerRepository.self)

        return eventRepo
            .find(slug: "2019", enabled: true)
            .flatMap(to: [Day].self) { event in
                guard let event = event else { throw Abort(.internalServerError) }
                return try dayRepo.all(event: event, enabled: true)
            }
            .flatMap(to: [ScheduleContext.DayWithScheduleEntry].self) { days in
                return try days.map { day in
                    try scheduleEntryRepo
                        .all(day: day, enabled: true)
                        .flatMap(to: [ScheduleContext.ScheduleEntryWithSpeakerAndTalk].self) { scheduleEntries in
                            try scheduleEntries.map { scheduleEntryAndRoom in
                                let (scheduleEntry, room) = scheduleEntryAndRoom
                                return try speakerRepo
                                    .find(scheduleEntry: scheduleEntry, enabled: true)
                                    .map(to: ScheduleContext.ScheduleEntryWithSpeakerAndTalk.self) { speakersAndTalk in
                                        return ScheduleContext.ScheduleEntryWithSpeakerAndTalk(
                                            scheduleEntry: scheduleEntry,
                                            speakers: speakersAndTalk?.0 ?? [],
                                            talk: speakersAndTalk?.1,
                                            room: room
                                        )
                                    }
                            }
                            .flatten(on: req)
                        }
                        .map(to: ScheduleContext.DayWithScheduleEntry.self) { scheduleEntries in
                            return ScheduleContext.DayWithScheduleEntry(day: day, scheduleEntries: scheduleEntries)
                        }
                }
                .flatten(on: req)
            }
            .flatMap { scheduleData in
                let context = ScheduleContext(days: scheduleData)
                return try req.view().render("App/YearX/Pages/Schedule/schedule", context)
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
    
    func reasonsToAttend(_ req: Request) throws -> Future<View> {
        let reasonsToAttendContext = ReasonsToAttendContext()
        return try req.view().render("App/YearX/Pages/ReasonsToAttend/reasonsToAttend", reasonsToAttendContext)
    }

    func codeOfConductHandler(_ req: Request) throws -> Future<View> {
        let cocContext = CodeOfConductContext()
        return try req.view().render("App/YearX/Pages/CodeOfConduct/code-of-conduct", cocContext)
    }
  
    func speakerProfileHandler(_ req: Request) throws -> Future<View> {
        let eventRepo = try req.make(EventRepository.self)
        let talkRepo = try req.make(TalkRepository.self)
        let roomRepo = try req.make(RoomRepository.self)
      
        // Closure to serve view with just speaker if no event or talk is given yet.
        let viewWithNoTalk = { (speaker: Speaker) -> Future<View> in
            let context = SpeakerProfileContext(speaker: speaker, talksWithScheduleEntries: [])
            return try req.view().render("App/YearX/Pages/Speakers/profile", context)
        }
      
        let speakerSlug = try req.parameters.next(String.self)
        return try Speaker.resolveParameter(speakerSlug, on: req)
            .and(eventRepo.find(slug: "2019", enabled: true))
            .flatMap { speaker, event in
                guard let event = event else { return try viewWithNoTalk(speaker) }
                return try talkRepo
                    .all(speaker: speaker, event: event, enabled: true)
                    .flatMap(to: [SpeakerProfileContext.TalkAndScheduleEntryAndRoom].self) { talks in
                        return try talks.map { talk in
                            return try talk.scheduleEntries
                                .query(on: req)
                                .filter(\.enabled == true)
                                .first()
                                .flatMap(to: SpeakerProfileContext.TalkAndScheduleEntryAndRoom.self) { scheduleEntry in
                                    guard let scheduleEntry = scheduleEntry else {
                                        return req.future(SpeakerProfileContext.TalkAndScheduleEntryAndRoom(talk: talk, scheduleEntry: nil, room: nil))
                                    }

                                    return try roomRepo.find(scheduleEntry: scheduleEntry, enabled: true)
                                        .map { room in
                                            SpeakerProfileContext.TalkAndScheduleEntryAndRoom(talk: talk, scheduleEntry: scheduleEntry, room: room)
                                        }
                                }
                        }.flatten(on: req)
                    }
                    .flatMap { talksWithScheduleEntries in
                        let context = SpeakerProfileContext(speaker: speaker, talksWithScheduleEntries: talksWithScheduleEntries)
                        return try req.view().render("App/YearX/Pages/Speakers/profile", context)
                    }
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

struct ScheduleContext: Encodable {
    struct ScheduleEntryWithSpeakerAndTalk: Encodable {
        let scheduleEntry: ScheduleEntry
        let speakers: [Speaker]
        let talk: Talk?
        let room: Room?
    }

    struct DayWithScheduleEntry: Encodable {
        let day: Day
        let scheduleEntries: [ScheduleEntryWithSpeakerAndTalk]
    }

    let page = ["schedule": true]
    let days: [DayWithScheduleEntry]
}

struct SpeakerProfileContext: Encodable {
    struct TalkAndScheduleEntryAndRoom: Encodable {
        let talk: Talk
        let scheduleEntry: ScheduleEntry?
        let room: Room?
    }

    let page = ["speakers": true]
    let speaker: Speaker
    let talksWithScheduleEntries: [TalkAndScheduleEntryAndRoom]
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

struct ReasonsToAttendContext: Encodable {
    let page = ["reasonsToAttend": true]
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
