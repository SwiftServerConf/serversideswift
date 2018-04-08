import Vapor

final class Routes: RouteCollection {
  let view: ViewRenderer
  init(_ view: ViewRenderer) {
    self.view = view
  }

  func build(_ builder: RouteBuilder) throws {
    
    builder.get("/") { req in
      return try self.view.make("pages/home")
    }

    builder.get("/speakers") { req in
        return try self.view.make("pages/speakers")
    }

    builder.get("/sponsors") { req in
        return try self.view.make("pages/sponsors")
    }

    builder.get("thank-you") { req in
      return try self.view.make("pages/thank-you")
    }
  }
}
