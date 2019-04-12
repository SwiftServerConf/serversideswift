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
    }
    
    func homepageHandler(_ req: Request) throws -> Future<View> {
        return try req.view().render("year2018/home", ["home": true])
    }
    
    func videosHandler(_ req: Request) throws -> Future<View> {
        struct VideosContext: Encodable {
            
        }
        let context = VideosContext()
        return try req.view().render("year2018/videos", context)
    }
    
    func photosHandler(_ req: Request) throws -> Future<View> {
        struct PhotosContext: Encodable {
            
        }
        let context = PhotosContext()
        return try req.view().render("year2018/photos", context)
    }
    
    func allSpeakersHandler(_ req: Request) throws -> Future<View> {
        struct SpeakersContext: Encodable {
            let speakers: [Speaker]
        }
        // TOOD tidy up with a join
        return Event.query(on: req).filter(\.title == "2018").first().unwrap(or: Abort(.internalServerError)).flatMap { event in
            return try event.days.query(on: req).all().flatMap { days in
                var entryResults = [Future<[ScheduleEntry]>]()
                for day in days {
                    try entryResults.append(day.scheduleEntries.query(on: req).all())
                }
                return entryResults.flatten(on: req).flatMap { entryArray in
                    let entries = entryArray.flatMap { $0 }
                    var talkResults = [Future<[Talk]>]()
                    for entry in entries {
                        talkResults.append(Talk.query(on: req).filter(\.id == entry.talkID).all())
                    }
                    return talkResults.flatten(on: req).flatMap { talkArrays in
                        let talks = talkArrays.flatMap { $0 }
                        var speakerResults = [Future<[Speaker]>]()
                        for talk in talks {
                            try speakerResults.append(talk.speakers.query(on: req).all())
                        }
                        return speakerResults.flatten(on: req).flatMap { speakerArray in
                            let speakers = speakerArray.flatMap { $0 }
                            let context = SpeakersContext(speakers: speakers)
                            return try req.view().render("year2018/speakers", context)
                        }
                    }
                }
            }
        }
    }
    
    func speakerHandler(_ req: Request) throws -> Future<View> {
        return try req.parameters.next(Speaker.self).flatMap { speaker in
            struct SpeakerContext: Encodable {
                let speaker: Speaker
            }
            let context = SpeakerContext(speaker: speaker)
            return try req.view().render("year2018/speaker-profile", context)
        }
    }
    
    func scheduleHandler(_ req: Request) throws -> Future<View> {
        return try req.view().render("year2018/schedule", ["schedule": true])
    }
    
    func locationHandler(_ req: Request) throws -> Future<View> {
        return try req.view().render("year2018/location", ["location": true])
    }
    
    func sponsorsHandler(_ req: Request) throws -> Future<View> {
        return try req.view().render("year2018/sponsors", ["sponsors": true])
    }
}
