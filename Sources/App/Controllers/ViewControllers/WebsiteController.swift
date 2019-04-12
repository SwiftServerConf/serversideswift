import Vapor

struct WebsiteController: RouteCollection {
    func boot(router: Router) throws {
        let year2018 = router.grouped("2018")
        try year2018.register(collection: Year2018Controller())
    }
}
