import Vapor

struct WebsiteController: RouteCollection {
    func boot(router: Router) throws {
        try router.register(collection: YearXController())

        let yearX = router.grouped("2019")
        try yearX.register(collection: YearXController())
      
        let year2018 = router.grouped("2018")
        try year2018.register(collection: Year2018Controller())
    }
}
