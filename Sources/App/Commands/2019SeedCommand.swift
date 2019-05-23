import Fluent
import FluentMySQL
import HTTP
import Vapor

struct Seed2019Command: Command {
    public var arguments: [CommandArgument] {
        return []
    }

    public var options: [CommandOption] {
        return []
    }

    public var help: [String] {
        return ["Seeds the db with 2019 content."]
    }

    public func run(using context: CommandContext) throws -> Future<Void> {
        struct SeedEntry {
            let speakers: [Speaker]
            let talk: Talk
            let schedule: ScheduleEntry
        }

        struct Schedule {
            let dayID: Int
            let roomID: Int
            let startTime: Date
            let endTime: Date
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "CEST")

        return context.container.withPooledConnection(to: .mysql) { db in
            // Event
            let event = Event(slug: "2019", title: "2019", order: 1, primary: true, enabled: true)

            return event.save(on: db).flatMap { event in
                guard let eventID = event.id else { throw Abort(.internalServerError) }

                // Days
                let days = [
                    Day(eventID: eventID, date: dateFormatter.date(from: "2019-10-30 00:00")!, title: "Workshops", enabled: true).save(on: db),
                    Day(eventID: eventID, date: dateFormatter.date(from: "2019-10-31 00:00")!, title: "Conference day 1", enabled: true).save(on: db),
                    Day(eventID: eventID, date: dateFormatter.date(from: "2019-11-01 00:00")!, title: "Conference day 2", enabled: true).save(on: db)
                ]

                // Rooms
                let rooms = [
                    Room(eventID: eventID, title: "Workshop room 1 (Havnerummet)", order: 0, enabled: true).save(on: db),
                    Room(eventID: eventID, title: "Workshop room 2 (Byrummet)", order: 1, enabled: true).save(on: db),
                    Room(eventID: eventID, title: "Conference room (Salen)", order: 2, enabled: true).save(on: db)
                ]

                let daysFuture = days.flatten(on: context.container)
                let roomsFuture = rooms.flatten(on: context.container)

                return daysFuture.and(roomsFuture).flatMap { arg in
                    let (days, rooms) = arg

                    guard
                        let conferenceDay1ID = days[1].id,
                        let conferenceRoomID = rooms[2].id
                    else {
                        throw Abort(.internalServerError)
                    }

                    let talks: [(Schedule, [Speaker], Talk)] = [
                        (
                          Schedule(
                            dayID: conferenceDay1ID,
                            roomID: conferenceRoomID,
                            startTime: dateFormatter.date(from: "2018-09-14 09:45")!,
                            endTime: dateFormatter.date(from: "2018-09-14 10:30")!
                          ),
                          [Speaker(
                            slug: "daniel-alm",
                            name: "Daniel Alm",
                            title: "Mac & iOS Developer",
                            company: "Self-Employed",
                            imageURL: "/App/Images/speakers/daniel-alm.jpg",
                            bio: "Daniel Alm is an independent Mac and iOS developer. After two years at Google, he nowadays mostly works on his app Timing (https://timingapp.com/). He also is a core contributor to the SwiftGRPC Open Source project (https://github.com/grpc/grpc-swift).",
                            twitterHandle: "daniel_a_a",
                            gitHubHandle: "mrmage",
                            order: 18,
                            enabled: true
                            )],
                          Talk(
                            talkType: .talk,
                            title: "--dummy--",
                            videoType: .youTube,
                            videoReference: "--dummy--",
                            enabled: false
                          )
                      ),
                      (
                        Schedule(
                          dayID: conferenceDay1ID,
                          roomID: conferenceRoomID,
                          startTime: dateFormatter.date(from: "2018-09-14 09:45")!,
                          endTime: dateFormatter.date(from: "2018-09-14 10:30")!
                        ),
                        [Speaker(
                          slug: "joannis-orlandos",
                          name: "Joannis Orlandos",
                          title: "Writer",
                          company: "Ray Wenderlich",
                          imageURL: "/App/Images/speakers/joannis-orlandos.jpg",
                          bio: "I'm the developer of the OpenKitten libraries and have been one of the two designers and developers of Vapor 3 during it's alpha and beta stages. I'm also a writer for Ray Wenderlich under the server-side Swift pillar.",
                          twitterHandle: "joannisorlandos",
                          gitHubHandle: "joannis",
                          order: 19,
                          enabled: true
                          )],
                        Talk(
                          talkType: .talk,
                          title: "--dummy--",
                          videoType: .youTube,
                          videoReference: "--dummy--",
                          enabled: false
                        )
                      ),
                      (
                        Schedule(
                          dayID: conferenceDay1ID,
                          roomID: conferenceRoomID,
                          startTime: dateFormatter.date(from: "2018-09-14 09:45")!,
                          endTime: dateFormatter.date(from: "2018-09-14 10:30")!
                        ),
                        [Speaker(
                          slug: "heidi-hermann",
                          name: "Heidi Hermann",
                          title: "Junior Vapor Developer",
                          company: "Nodes",
                          imageURL: "/App/Images/speakers/heidi-hermann.jpeg",
                          bio: "Heidi is a self-made Swift and Vapor developer. With a background in Physics and teaching she transitioned into  software development just over two years ago. Today she works as a Backend Junior Vapor Developer at Nodes Agency in Berlin.",
                          twitterHandle: "heidipuk",
                          gitHubHandle: "heidipuk",
                          order: 20,
                          enabled: true
                          )],
                        Talk(
                          talkType: .talk,
                          title: "--dummy--",
                          videoType: .youTube,
                          videoReference: "--dummy--",
                          enabled: false
                        )
                      ),
                    ]

                    let futures = talks
                        .map { (arg: (Schedule, [Speaker], Talk)) -> Future<(ScheduleEntry, [TalkSpeaker])> in
                            let (schedule, speakers, talk) = arg
                            let speakersFuture = speakers.map { $0.save(on: db) }.flatten(on: db)
                            let talkFuture = talk.save(on: db)

                            return speakersFuture.and(talkFuture).flatMap { arg in
                                let (speakers, talk) = arg
                                let scheduleEntryFuture = ScheduleEntry(
                                    dayID: schedule.dayID,
                                    roomID: schedule.roomID,
                                    talkID: talk.id,
                                    title: nil,
                                    startTime: schedule.startTime,
                                    endTime: schedule.endTime,
                                    entryType: .talk,
                                    enabled: true
                                ).save(on: db)

                                let talkSpeakers = try speakers.map { try TalkSpeaker(talk, $0) }
                                let talkSpeakersFuture = talkSpeakers.map { $0.save(on: db) }.flatten(on: db)

                                return scheduleEntryFuture.and(talkSpeakersFuture)
                            }
                        }

                    return futures.flatten(on: db).transform(to: ())
                }
            }
        }
    }
}
