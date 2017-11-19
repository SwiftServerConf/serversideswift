import Vapor
import HTTP

final class SpeakerController {
  let view: ViewRenderer
  init(_ view: ViewRenderer) {
    self.view = view
  }
}
