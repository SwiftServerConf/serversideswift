import Vapor

final class Routes: RouteCollection {
  let view: ViewRenderer
  init(_ view: ViewRenderer) {
    self.view = view
  }

  func build(_ builder: RouteBuilder) throws {
    
    builder.get { req in
        return try self.view.make("one")
    }
    
    builder.get("two") { req in
      return try self.view.make("two")
    }

    builder.get("thank-you") { req in
      return try self.view.make("thank-you")
    }
  }
}
