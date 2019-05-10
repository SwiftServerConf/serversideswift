import Vapor
import Fluent

struct YearXController: RouteCollection {
  func boot(router: Router) throws {
    router.get(use: homepageHandler)
  }
  
  func homepageHandler(_ req: Request) throws -> Future<View> {
    let homeContext = HomeContext()
    return try req.view().render("App/YearX/Pages/home", homeContext)
  }
}

struct HomeContext: Encodable {
  let page = ["home": true]
}
