import Fluent
import FluentMySQL
import HTTP
import Vapor

struct Seed2018Command: Command {
    public var arguments: [CommandArgument] {
        return []
    }

    public var options: [CommandOption] {
        return []
    }

    public var help: [String] {
        return ["Seeds the db with 2018 content."]
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
            let event = Event(slug: "2018", title: "2018", order: 0, primary: false, enabled: true)

            return event.save(on: db).flatMap { event in
                guard let eventID = event.id else { throw Abort(.internalServerError) }

                // Days
                let days = [
                    Day(eventID: eventID, date: dateFormatter.date(from: "2018-09-12 00:00")!, title: "Workshops", enabled: true).save(on: db),
                    Day(eventID: eventID, date: dateFormatter.date(from: "2018-09-13 00:00")!, title: "Conference day 1", enabled: true).save(on: db),
                    Day(eventID: eventID, date: dateFormatter.date(from: "2018-09-14 00:00")!, title: "Conference day 2", enabled: true).save(on: db)
                ]

                // Rooms
                let rooms = [
                    Room(eventID: eventID, title: "Workshop room 1", order: 0, enabled: true).save(on: db),
                    Room(eventID: eventID, title: "Workshop room 2", order: 1, enabled: true).save(on: db),
                    Room(eventID: eventID, title: "Conference room", order: 2, enabled: true).save(on: db)
                ]

                let daysFuture = days.flatten(on: context.container)
                let roomsFuture = rooms.flatten(on: context.container)

                return daysFuture.and(roomsFuture).flatMap { arg in
                    let (days, rooms) = arg

                    guard
                        let workshopDayID = days[0].id,
                        let conferenceDay1ID = days[1].id,
                        let conferenceDay2ID = days[2].id,
                        let workshopRoom1ID = rooms[0].id,
                        let workshopRoom2ID = rooms[1].id,
                        let conferenceRoomID = rooms[2].id
                    else {
                        throw Abort(.internalServerError)
                    }

                    let talks: [(Schedule, [Speaker], Talk)] = [
                        (
                            Schedule(
                                dayID: conferenceDay1ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-13 11:00")!,
                                endTime: dateFormatter.date(from: "2018-09-13 11:45")!
                            ),
                            [Speaker(
                                slug: "tanner-nelson",
                                name: "Tanner Nelson",
                                title: "Co-Founder",
                                company: "Vapor",
                                imageURL: "/App/Year2018/images/speakers/tanner_nelson.jpeg",
                                bio: "Tanner Wayne Nelson is an American software engineer based in New York City. He started programming in elementary school and went on to study Computer Science at New York University. Tanner created Vapor in 2016 and now works full time maintaining the core framework and the dozens of packages around it.",
                                twitterHandle: "tanner0101",
                                gitHubHandle: "tanner0101",
                                order: 0,
                                enabled: true
                            )],
                            Talk(
                                talkType: .talk,
                                title: "Vapor State Of The Union",
                                videoType: .youTube,
                                videoReference: "_615REC32Ts",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay1ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-13 16:00")!,
                                endTime: dateFormatter.date(from: "2018-09-13 16:45")!
                            ),
                            [Speaker(
                                slug: "james-thomas",
                                name: "James Thomas",
                                title: "Developer advocate",
                                company: "IBM",
                                imageURL: "/App/Year2018/images/speakers/james_thomas.png",
                                bio: "James Thomas is a Developer Advocate for IBM’s Cloud division. James is a huge fan of all thing serverless! He spends his time speaking at conferences, blogging or writing open-source code to share the awesomeness of serverless cloud platforms.",
                                twitterHandle: "thomasj",
                                gitHubHandle: "jthomas",
                                order: 1,
                                enabled: true
                            )],
                            Talk(
                                talkType: .talk,
                                title: "Serverless Swift with Apache OpenWhisk",
                                videoType: .youTube,
                                videoReference: "Z6vVWGZ6sTs",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay1ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-13 14:15")!,
                                endTime: dateFormatter.date(from: "2018-09-13 15:00")!
                            ),
                            [Speaker(
                                slug: "kyle-jessup",
                                name: "Kyle Jessup",
                                title: "CTO",
                                company: "Perfect",
                                imageURL: "/App/Year2018/images/speakers/kyle_jessup.jpg",
                                bio: "Kyle Jessup invented the Perfect framework. A self-taught programmer, he has extensive knowledge of other programming languages including Swift, Java, and C++.",
                                gitHubHandle: "kjessup",
                                order: 2,
                                enabled: true
                            )],
                            Talk(
                                talkType: .talk,
                                title: "Diving into Perfect and Internet of Things",
                                videoType: .youTube,
                                videoReference: "GuhMpvNle64",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay2ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-14 09:00")!,
                                endTime: dateFormatter.date(from: "2018-09-14 09:45")!
                            ),
                            [
                                Speaker(
                                    slug: "ian-partridge",
                                    name: "Ian Partridge",
                                    title: "Kitura Team Lead Swift",
                                    company: "IBM",
                                    imageURL: "/App/Year2018/images/speakers/ian-partridge.jpg",
                                    bio: "The technical lead of the Swift@IBM development team, working in open source to bring Swift to the cloud. A committer to the core Swift libraries and a developer of Kitura, one of the leading Swift web frameworks, he comes from a background in virtual machine performance and debugging.",
                                    twitterHandle: "alfa",
                                    gitHubHandle: "ianpartridge",
                                    order: 3,
                                    enabled: true
                                ),
                                Speaker(
                                    slug: "pim-stolk",
                                    name: "Pim Stolk",
                                    title: "iOS Chapter Lead",
                                    company: "ING",
                                    imageURL: "/App/Year2018/images/speakers/pim-stolk.jpg",
                                    bio: "iOS developer since 2008 and is working at the ING for the past seven years. Pim is a true mobile and technology enthusiast and is currently working on a new IoT platform mainly written in Swift.",
                                    twitterHandle: "stolkcc",
                                    gitHubHandle: "pimstolk",
                                    order: 9,
                                    enabled: true
                                )
                            ],
                            Talk(
                                talkType: .talk,
                                title: "From Idea to Production at ING",
                                videoType: .youTube,
                                videoReference: "NZwTz8j5GXc",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay1ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-13 15:15")!,
                                endTime: dateFormatter.date(from: "2018-09-13 16:00")!
                            ),
                            [Speaker(
                                slug: "stanislav-dombrovsky",
                                name: "Stanislav Dombrovsky",
                                title: "AppCode PMM",
                                company: "JetBrains",
                                imageURL: "/App/Year2018/images/speakers/stanislav_dombrovsky.jpg",
                                bio: "A mobile developer with 7 years of experience who joined the AppCode team at JetBrains to combine my experience in mobile development with the new world of making developer tools.",
                                twitterHandle: "s_dombrovsky",
                                gitHubHandle: "yeswolf",
                                order: 4,
                                enabled: true
                            )],
                            Talk(
                                talkType: .talk,
                                title: "Thinking like an IDE, the Challenges of Server-Side Swift",
                                videoType: .youTube,
                                videoReference: "Bp8ekbxRRO8",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay1ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-13 10:00")!,
                                endTime: dateFormatter.date(from: "2018-09-13 10:45")!
                            ),
                            [Speaker(
                                slug: "kaitlin-mahar",
                                name: "Kaitlin Mahar",
                                title: "Software Engineer",
                                company: "MongoDB",
                                imageURL: "/App/Year2018/images/speakers/kaitlin-mahar.jpg",
                                bio: "A software engineer in NYC at MongoDB, where I'm the primary engineer working on the new official MongoDB Driver for Swift.",
                                twitterHandle: "k__mahar",
                                gitHubHandle: "kmahar",
                                order: 5,
                                enabled: true
                            )],
                            Talk(
                                talkType: .talk,
                                title: "Swift's Encoder and Decoder Protocols",
                                videoType: .youTube,
                                videoReference: "yL5Ff5p1hyc",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay2ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-14 14:00")!,
                                endTime: dateFormatter.date(from: "2018-09-14 14:45")!
                            ),
                            [Speaker(
                                slug: "kenichi-ueno",
                                name: "Kenichi Ueno",
                                title: "iOS Developer",
                                company: "LINE Corporation",
                                imageURL: "/App/Year2018/images/speakers/kenichi_ueno.jpg",
                                bio: "Has 8 years of iOS development experience at LINE Corporation and uses Kitura for server-side swift development.",
                                twitterHandle: "keno42",
                                gitHubHandle: "keno42",
                                order: 6,
                                enabled: true
                            )],
                            Talk(
                                talkType: .talk,
                                title: "Server-Side Swift Experiences and Pitfalls Coming from iOS",
                                videoType: .youTube,
                                videoReference: "dDGdZuQV0kw",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay2ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-14 10:45")!,
                                endTime: dateFormatter.date(from: "2018-09-14 11:30")!
                            ),
                            [Speaker(
                                slug: "markus-weyerhauser",
                                name: "Markus Weyerhäuser",
                                title: "CTO",
                                company: "SEEDFUNNEL",
                                imageURL: "/App/Year2018/images/speakers/markus_weyerhaeuser.jpg",
                                bio: "Markus has more then 20 years of experience in software product development covering the full range of the overall life-cycle from spotting hot technology trends, designing and implementing actual shippable code and analysing the market for a successful product launch.",
                                twitterHandle: "mweyerhaeuser",
                                order: 7,
                                enabled: true
                            )],
                            Talk(
                                talkType: .talk,
                                title: "From Idea to Market — an Extremely Challenging Journey",
                                videoType: .youTube,
                                videoReference: "x7CZAhP9KyA",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay1ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-13 09:15")!,
                                endTime: dateFormatter.date(from: "2018-09-13 10:00")!
                            ),
                            [Speaker(
                                slug: "ralph-kupper",
                                name: "Ralph Küpper",
                                title: "CEO",
                                company: "Skelpo",
                                imageURL: "/App/Year2018/images/speakers/ralph_kuepper.jpeg",
                                bio: "Entrepreneur and developer in upcoming tech markets.",
                                twitterHandle: "amlug",
                                gitHubHandle: "proggeramlug",
                                order: 8,
                                enabled: true
                            )],
                            Talk(
                                talkType: .talk,
                                title: "Running Small Microservices in Swift on Production Environment",
                                videoType: .youTube,
                                videoReference: "il7W28Ekor4",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay1ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-13 13:30")!,
                                endTime: dateFormatter.date(from: "2018-09-13 14:15")!
                            ),
                            [Speaker(
                                slug: "marcin-kliks",
                                name: "Marcin Kliks",
                                title: "Devops Team Leader",
                                company: "Allegro",
                                imageURL: "/App/Year2018/images/speakers/marcin_kliks.jpg",
                                bio: "A Devops Team Leader at Allegro and creator of a data center management software who recently fell in love with server-side swift.",
                                twitterHandle: "vi4m",
                                gitHubHandle: "vi4m",
                                order: 10,
                                enabled: true
                            )],
                            Talk(
                                talkType: .talk,
                                title: "Swifty Microservices in Production",
                                videoType: .youTube,
                                videoReference: "vyW-a3N0odk",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay2ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-14 11:30")!,
                                endTime: dateFormatter.date(from: "2018-09-14 12:15")!
                            ),
                            [Speaker(
                                slug: "konrad-feiler",
                                name: "Konrad Feiler",
                                title: "Co-Founder",
                                company: "looc.io",
                                imageURL: "/App/Year2018/images/speakers/konrad-feiler.jpg",
                                bio: "A mathematician turned software engineer, Konrad Feiler has been creating mobile apps for the past seven years, and after work as iOS architect for Viacom currently focusses on his own companies.",
                                twitterHandle: "bersaelor",
                                gitHubHandle: "bersaelor",
                                order: 11,
                                enabled: true
                            )],
                            Talk(
                                talkType: .talk,
                                title: "How Server-Side and Mobile Swift Can Benefit from Each Other",
                                videoType: .youTube,
                                videoReference: "xA3ZYt5S6iA",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay1ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-13 11:45")!,
                                endTime: dateFormatter.date(from: "2018-09-13 12:30")!
                            ),
                            [Speaker(
                                slug: "spartak-buniatyan",
                                name: "Spartak Buniatyan",
                                title: "Founder",
                                company: "SwiftEngine.io",
                                imageURL: "/App/Year2018/images/speakers/spartak-buniatyan.jpg",
                                bio: "Spartak Buniatyan, has been in the technology development field for over 20 years with heavy experience in developing technologies for large scale enterprise applications in the mobile apps field. Managing large multidisciplinary teams, and understanding the challenges of sustaining high scale customer facing applications. Spartak is the founder of SwiftEngine.io, he oversees and is responsible for SwiftEngine.io’s design and development operations. SwiftEngine.io, is the first turnkey serverless-swift platform for app development.  The server-side Swift framework for SwiftEnigne.io is also open-source and available on Github. Prior to founding SwiftEngine.io, he applied his considerable expertise in software engineering to a number of large enterprises, including DIRECTV/AT&T, nation's largest Satellite TV provider, and Medtronic, a global leader in medical technology, services, and solutions, leading both organizations’ mobile-app development teams. Mr. Buniatyan received his MBA from the University of Southern California. He also holds two utility patents in the technology space.",
                                order: 12,
                                enabled: true
                            )],
                            Talk(
                                talkType: .talk,
                                title: "Managing Server-Side Swift at Scale with CoreOS, Docker and Terraform on Any Cloud Provider",
                                videoType: .youTube,
                                videoReference: "ti4UhT7EPAA",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay2ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-14 13:15")!,
                                endTime: dateFormatter.date(from: "2018-09-14 14:00")!
                            ),
                            [Speaker(
                                slug: "steven-van-impe",
                                name: "Steven Van Impe",
                                title: "Lecturer",
                                company: "University College Ghent. Technical Editor @ raywenderlich.com",
                                imageURL: "/App/Year2018/images/speakers/steven-van-impe.png",
                                bio: "Steven is a lecturer at University College Ghent and a technical editor for <a href=\"https://www.raywenderlich.com\">raywenderlich.com</a>. You can find out more information at <a href=\"http://svanimpe.be/about\">http://svanimpe.be/about</a>.",
                                twitterHandle: "svanimpe",
                                gitHubHandle: "svanimpe",
                                order: 13,
                                enabled: true
                            )],
                            Talk(
                                talkType: .talk,
                                title: "Server-Side Web Apps with Kitura and Stencil",
                                videoType: .youTube,
                                videoReference: "w3jlii__XBE",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay2ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-14 15:45")!,
                                endTime: dateFormatter.date(from: "2018-09-14 16:30")!
                            ),
                            [
                                Speaker(
                                    slug: "casper-rasmussen",
                                    name: "Casper Rasmussen",
                                    title: "CTO",
                                    company: "Nodes",
                                    imageURL: "/App/Year2018/images/speakers/casper-rasmussen.jpeg",
                                    bio: "CTO and partner at Nodes and board member at Vapor.",
                                    gitHubHandle: "Casperhr",
                                    order: 14,
                                    enabled: true
                                ),
                                Speaker(
                                    slug: "christian-weinberger",
                                    name: "Christian Weinberger",
                                    title: "Technical Director",
                                    company: "Nodes",
                                    imageURL: "/App/Year2018/images/speakers/christian-weinberger.jpg",
                                    bio: "Christian is a tech enthusiast and Technical Director at Nodes Germany where he fell in love with Vapor. He is working with his team from a co-working space in Berlin, near Hausvogteiplatz. Feel free to pass by if you want to <a href=\"https://www.nodesagency.com/vapor\">chat about Vapor</a> anytime.",
                                    twitterHandle: "_cweinberger",
                                    gitHubHandle: "cweinberger",
                                    order: 15,
                                    enabled: true
                                )
                            ],
                            Talk(
                                talkType: .talk,
                                title: "Vapor in Production - How to Convince the Client",
                                videoType: .youTube,
                                videoReference: "KNT5a16w_30",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay2ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-14 15:00")!,
                                endTime: dateFormatter.date(from: "2018-09-14 15:45")!
                            ),
                            [Speaker(
                                slug: "helge-Hess",
                                name: "Helge Heß",
                                title: "ZEO",
                                company: "ZeeZide GmbH",
                                imageURL: "/App/Year2018/images/speakers/helge-hess.jpeg",
                                bio: "Helge started coding on NeXT machines >20 years ago. Some (including himself) claim that he is almost always sometimes right. Currently doing software projects at ZeeZide & fun stuff at the AlwaysRightInstitute. Previously worked at Apple, ZideOne, Brainstorm, Skyrix/OpenGroupware.org.",
                                twitterHandle: "helje5",
                                gitHubHandle: "helje5",
                                order: 16,
                                enabled: true
                            )],
                            Talk(
                                talkType: .talk,
                                title: "SwiftNIO on the Raspberry Pi",
                                videoType: .youTube,
                                videoReference: "FPGf652O90Y",
                                enabled: true
                            )
                        ),
                        (
                            Schedule(
                                dayID: conferenceDay2ID,
                                roomID: conferenceRoomID,
                                startTime: dateFormatter.date(from: "2018-09-14 09:45")!,
                                endTime: dateFormatter.date(from: "2018-09-14 10:30")!
                            ),
                            [Speaker(
                                slug: "jari-koopman",
                                name: "Jari Koopman",
                                title: "iOS Developer",
                                company: "Wehkamp",
                                imageURL: "/App/Year2018/images/speakers/jari-koopman.jpg",
                                bio: "My name is Jari, I'm 16 years old and I'm a WWDC 2017 Scholarship winner and iOS Developer at Wehkamp, one of the biggest online fashion retailers in the Netherlands.",
                                twitterHandle: "LotUDev",
                                gitHubHandle: "MrLotU",
                                order: 17,
                                enabled: true
                            )],
                            Talk(
                                talkType: .talk,
                                title: "Streamlining Our CD Flow Using Server-Side Swift, Fastlane and Travis CI",
                                videoType: .youTube,
                                videoReference: "HYS8f4ep1Ng",
                                enabled: true
                            )
                        ),
                        (
                          Schedule(
                            dayID: conferenceDay2ID,
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
                          dayID: conferenceDay2ID,
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
                          dayID: conferenceDay2ID,
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
