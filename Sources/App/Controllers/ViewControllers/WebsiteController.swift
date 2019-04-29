import Vapor

struct WebsiteController: RouteCollection {
    func boot(router: Router) throws {
        let yearX = router
        try yearX.register(collection: YearXController())
      
        let year2018 = router.grouped("2018")
        try year2018.register(collection: Year2018Controller())
    }
}
