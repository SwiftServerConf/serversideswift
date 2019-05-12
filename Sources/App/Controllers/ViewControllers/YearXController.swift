import Vapor
import Fluent

struct YearXController: RouteCollection {
    func boot(router: Router) throws {
        router.get(use: homepageHandler)
        router.get("faq", use: faqHandler)
        router.get("code-of-conduct", use: codeOfConductHandler)
    }

    func homepageHandler(_ req: Request) throws -> Future<View> {
        let homeContext = HomeContext()
        return try req.view().render("App/YearX/Pages/Home/home", homeContext)
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

struct FaqContext: Encodable {
    let page = ["faq": true]
}

struct CodeOfConductContext: Encodable {
    let page = ["code-of-conduct": true]
}
