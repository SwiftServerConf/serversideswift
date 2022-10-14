import Foundation

protocol Eventable {
    var eventSpecifics: EventSpecifics? { get }
}

struct EventSpecifics {
    var startTime: Date
    var endTime: Date
    var place: String
}

struct AllEvents {
    static let events: [Eventable] = AllTalks.talks
}

extension Date {
    internal init(at time: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let completeDateString = "9-12-2022 \(time)"
        let date = dateStringFormatter.date(from: completeDateString)!
        self.init(timeInterval: 0, since: date)
    }
}
