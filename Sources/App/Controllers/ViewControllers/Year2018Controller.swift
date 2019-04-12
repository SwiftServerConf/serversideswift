import Vapor

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
            
        }
        let context = SpeakersContext()
        return try req.view().render("year2018/speakers", context)
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
