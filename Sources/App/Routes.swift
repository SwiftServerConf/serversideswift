import Vapor

final class Routes: RouteCollection {
  let view: ViewRenderer
  init(_ view: ViewRenderer) {
    self.view = view
  }

  func build(_ builder: RouteBuilder) throws {

    builder.get("/") { req in
        return try self.view.make("pages/home", ["home": true])
    }

    builder.get("/about") { req in
        return try self.view.make("pages/about", ["about": true])
    }

    builder.get("/speakers") { req in
        return try self.view.make(
            "pages/speakers",
            ["speakers": Speaker.allSpeaker()]
        )
    }

    builder.get("/speakers", Speaker.parameter) { req in
        let speaker = try req.parameters.next(Speaker.self)

        return try self.view.make(
            "pages/speaker-profile",
            ["speakers": true, "speaker": speaker]
        )
    }

    builder.get("/location") { req in
        return try self.view.make("pages/location", ["location": true])
    }

    builder.get("/sponsors") { req in
        return try self.view.make("pages/sponsors", ["sponsors": true])
    }

    builder.get("thank-you") { req in
      return try self.view.make("pages/thank-you")
    }

    builder.get("tickets") { req in
      return try self.view.make("pages/tickets")
    }

    builder.get("/code-of-conduct") { req in
      return try self.view.make("pages/code-of-conduct", ["code-of-conduct": true])
    }

    builder.get("/faq") { req in
      return try self.view.make("pages/faq", ["faq": true])
    }

    builder.get("/schedule") { req in
      return try self.view.make("pages/schedule", ["schedule": true])
    }
  }
}
