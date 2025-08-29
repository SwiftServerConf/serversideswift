import Plot

struct Speaker {
    let name: String
    let role: String?
    let company: String?
    let url: String
    let image: String
    let twitter: String?
    let github: String?
    let mastodon: String?
    let linkedIn: String?
    let website: String?
    let bio: Component
    let talkIDs: [Int]
    
    internal init(
        name: String,
        role: String?,
        company: String? = nil,
        image: String? = nil,
        twitter: String? = nil,
        github: String? = nil,
        mastodon: String? = nil,
        linkedIn: String? = nil,
        website: String? = nil,
        bio: Component,
        talkIDs: [Int]
    ) {
        self.name = name
        self.role = role
        self.company = company
        self.url = name.lowercased().replacingOccurrences(of: " ", with: "-").replacingOccurrences(of: "ö", with: "o")
        if let image {
            self.image = image
        } else {
            self.image = "/App/Images/speakers/\(name.lowercased().replacingOccurrences(of: " ", with: "-")).jpg"
        }
        self.twitter = twitter
        self.github = github
        self.mastodon = mastodon
        self.linkedIn = linkedIn
        self.website = website
        self.bio = bio
        self.talkIDs = talkIDs
    }
    
    internal init(
        name: String,
        role: String?,
        company: String? = nil,
        image: String? = nil,
        twitter: String? = nil,
        github: String? = nil,
        mastodon: String? = nil,
        linkedIn: String? = nil,
        website: String? = nil,
        bio: String,
        talkIDs: [Int]
    ) {
        self.init(name: name, role: role, company: company, image: image, twitter: twitter, github: github, mastodon: mastodon, linkedIn: linkedIn, website: website, bio: Text(bio), talkIDs: talkIDs)
    }
    
    var talks: [Talk] {
        AllTalks.talks.filter {
            self.talkIDs.contains($0.id)
        }
    }
}

struct AllSpeakers {
    static let emcee: Speaker = allSpeakers[0]
    static let instructors: [Speaker] = [
    ]
    static let speakers: [Speaker] =  Array(allSpeakers[1...])
    static let allSpeakers: [Speaker] = [
        Speaker(
            name: "Daniel Steinberg", 
            role: "Author, Speaker and Trainer", 
            company: "Dim Sum Thinking",
            image: "/App/Images/speakers/daniel-steinberg.png",
            mastodon: "https://mastodon.social/@dimsumthinking",
            bio: ComponentGroup {
                Paragraph {
                    Text("Daniel is the author of more than a dozen books including the best selling books ")
                    Link("The Curious Case of the Async Cafe", url: "https://editorscut.com/Books/Async/bookPage.html")
                    Text(", ")
                    Link("A SwiftUI Kickstart", url: "https://editorscut.com/Books/SwiftUIKickstart/bookPage.html")
                    Text(", ")
                    Link("A Swift Kickstart", url: "https://editorscut.com/Books/SwiftKickstart/bookPage.html")
                    Text(", ")
                    Link("A Bread Baking Kickstart", url: "https://editorscut.com/Books/Bread/bookPage.html")
                    Text(", and ")
                    Link("Dear Elena", url: "https://editorscut.com/Books/DearElena/bookPage.html")
                    Text(".")
                }
                Paragraph {
                    Text("Daniel presents iOS, SwiftUI, and Swift training and consults through his company ")
                    Link("Dim Sum Thinking", url: "https://dimsumthinking.com/")
                    Text(".")
                }
                Paragraph {
                    Text("He has written apps for the iPhone and the iPad since the SDKs first appeared and has written programs for the Mac all the way back to System 7. When he's not coding or talking about coding for the Mac, the iPhone, and the iPad he's probably cooking, baking bread, or hanging out with friends.")
                }
                Paragraph {
                    Text("Information on his ")
                    Link("books and videos", url: "https://editorscut.com/")
                    Text(" is available on the ")
                    Link("Editors Cut website", url: "https://editorscut.com/")
                    Text(". Details on his ")
                    Link("training", url: "https://dimsumthinking.com/Training/index.html")
                    Text(", and ")
                    Link("speaking", url: "https://dimsumthinking.com/Speaking/index.html")
                    Text(" is on the ")
                    Link("Dim Sum Thinking website", url: "https://dimsumthinking.com/")
                    Text(".")
                }
            },
            talkIDs: []
        ),
        Speaker(
            name: "Emma GAUBERT", 
            role: "iOS Developer", 
            company: "Decathlon", 
            bio: "My name is Emma and I'm a 27 frenchwoman currently working at Decathlon, a sporting goods company, as an iOS Developer. I started off working in marketing in small startups before growing bored of my job and quitting to learn how to build software. I built my first full-stack Swift app with Vapor and SwiftUI and haven't looked back since!", 
            talkIDs: [2]
        ),
        Speaker(
            name: "Joannis Orlandos", 
            role: nil, 
            twitter: "http://twitter.com/joannisorlandos",
            website: "https://swiftonserver.com/", 
            bio: "Joannis is a member of the Swift Server and Android Workgroups, and maintains for MongoKitten, Hummingbird and EdgeOS. Joannis helps clients implement Swift across their stack, from microcontrollers to iOS apps.", 
            talkIDs: [3]
        ),
        Speaker(
            name: "Matt Massicotte", 
            role: "Apple Platforms Developer", 
            website: "https://www.massicotte.org/",
            bio: "Matt keeps himself busy with training, consulting, writing, and working on open source projects. From individuals all the way up to large teams, he loves working with people to understand and solve problems. He's been developing for Apple platforms for about 30 years.", talkIDs: [4]
        ),
        Speaker(
            name: "Honza Dvorsky", 
            role: "Engineer on the Swift Server Ecosystem team", 
            company: "Apple", 
            website: "https://honzadvorsky.com/", 
            bio: "I'm Honza, a software engineer from the Czech Republic. I started as an iOS developer and over the past 9 years at Apple, I've been building developer tools and libraries - from Xcode, XCTest, and Xcode Cloud to more recently helping shape the Swift Server ecosystem through Swift OpenAPI Generator", 
            talkIDs: [5]),
        Speaker(
            name: "George Barnett",
            role: "Software Engineer",
            company: "Apple",
            bio: "George is a software engineer at Apple working predominantly on open-source Swift libraries. He's the primary maintainer of gRPC Swift and a member of the SwiftNIO core team. George is interested in building and maintaining easy-to-use libraries and has done so across a smorgasbord of domains from networking and database drivers, to observability and beyond.",
            talkIDs: [6]
        ),
        Speaker(
            name: "Moritz Lang", 
            role: "Senior iOS Engineer",
            company: "Blinkist", 
            website: "https://github.com/slashmo", 
            bio: ComponentGroup {
                Paragraph {
                    Text("Moritz (@slashmo) is a Senior iOS Engineer at Blinkist, based in Berlin. He's passionate about using Swift in other places, primarily on the server-side. In 2020, Moritz participated in Google Summer of Code where he built the Swift Distributed Tracing library. Additionally, he's maintaining an open-source OTel client called ")
                    Link("swift-otel", url: "https://github.com/swift-otel/swift-otel")
                    Text(".")
                }
                Paragraph {
                    Text("When not coding in Swift, Moritz likes to play beach volleyball and the electric guitar. You can find him on ")
                    Link("GitHub", url: "https://github.com/slashmo")
                    Text(" and ")
                    Link("Mastodon", url: "https://mastodon.social/@slashmo")
                    Text(".")
                }
            }, 
            talkIDs: [7]
        ),
        Speaker(
            name: "Adam Fowler", 
            role: "Open Source Developer",
            website: "https://opticalaberration.com/", 
            bio: ComponentGroup {
                Paragraph {
                    Text("Adam Fowler is a former video game developer who now works in open source, primarily building server based libraries using Swift. Adam is a member of the SSWG (Swift Server Workgroup) and maintains a number of key libraries in the swift server ecosystem including the web framework Hummingbird and Soto the unofficial Swift SDK for AWS.")
                }
                Paragraph {
                    Text("In his spare time he enjoys cycling, photography and eating out.")
                }
            }, 
            talkIDs: [8]
        ),
        Speaker(
            name: "Ben Rosen", 
            role: "Founder",
            company: "SongShift",
            twitter: "http://twitter.com/benmrosen",
            website: "https://benrosen.me/", 
            bio: "I am 22 years old, from Chicago, IL. and have been programming since I was 11 years old. My app, SongShift, has been on the App Store since 2016 and I have watched and contributed to growing it from a small app to one that is widely used and loved. During college I did 2 internships at Apple but decided to work on SongShift full time. This is entirely built with server-side Swift. I want people to know about me because I want to continue to spread the word that what I do is powered by these cool server-side Swift technologies. I want to know that I am someone people can contact and I want to be a friendly face for them.",
            talkIDs: [9]
        ),
        // Speaker(
        //     name: "Mona Dierickx", 
        //     role: "Applied Informatics graduate", 
        //     website: "https://www.linkedin.com/in/mona-dierickx/",
        //     bio: "Hi there! I am Mona, a recent Applied Informatics graduate who is passionate about the possible ways to apply AI to solve real-life problems.",
        //     talkIDs: [1]
        // ),
        Speaker(
            name: "Georg Tuparev", 
            role: "Founder",
            company: "Tuparev Software",
            twitter: "http://twitter.com/tuparev",
            website: "https://www.tuparev.com/",
            bio: ComponentGroup {
                Paragraph("My first real experience with computers was as a teenager when I created a simple application to control my homemade telescope on an Apple ][e. Soon after, I learned to program IBM 370 mainframes, writing FORTRAN programs to calculate FFTs for variable stars, as well as a PL/1-based accounting system. Before finishing high school, I programmed the weather station for Bulgaria’s first satellite and contributed to the development of the control software for the Bulgarian Academy of Sciences’ 2-meter telescope.")
                Paragraph("During my university studies in Heidelberg, Germany, and subsequent research at the European Molecular Biology Laboratory (EMBL), my work centred around protein folding and computer graphics using Silicon Graphics, SUN, DEC Alpha, Maspar, and NeXT computers. In this period, I developed the first Braille driver for NeXTStep, co-organised two scientific computing conferences, hosted the GNUStep project for two years, and contributed significantly to the MiscKit framework for NeXTStep. Additionally, I was an early adopter and contributor to the WebObjects framework (initially Objective-C-based, later Java-based).")
                Paragraph("I started developing for NeXTStep around 1990. Alongside engaging extensively in open source projects, I worked on a database for storing infrared astronomical images and developed image-processing software for NMR crystallographic data. Later, I was involved in the initial implementation of Apple’s VoiceOver accessibility technology and presented frequently on Apple’s behalf to the European banking and finance sectors. I also delivered a presentation at Apple’s WWDC focused on scientific applications.")
                Paragraph("During the last 25 or so years, my team worked on several highly complex systems. Examples include: - An educational portal for the Ministry of Education in Lower Saxony, Germany. - A legal documentation system for the Baden-Württemberg Police Department, Germany. - The Mars Rover image archive for NASA. - A fully robotic astronomical observatory control system, deployed in observatories across the U.S., South Africa, and Europe. - The largest inter-bank document and transaction exchange system in the Netherlands (ongoing) - Observatory control, image processing, and large-scale data storage solutions for space debris monitoring stations (ongoing).")
            },
            talkIDs: [10]
        ),
        // Speaker(
        //     name: "Oliver Binns", 
        //     role: "Software Engineer", 
        //     company: "Deloitte LLC", 
        //     website: "https://www.oliverbinns.co.uk/",
        //     bio: "Oliver is an experienced software engineer based in London. After attaining an IET accredited master’s degree in Computer Science from the University of York, he started his career building websites in PHP and JavaScript, before pivoting into native iOS development. He has worked on highly-rated mobile apps for airlines, healthcare organisations and even government departments. Oliver was shortlisted for British Computer Society’s Engineer of the Year 2024.", 
        //     talkIDs: [11]
        // ),
        Speaker(
            name: "Franz Busch", 
            role: "Software Engineer", 
            company: "Apple", 
            twitter: "http://twitter.com/FranzJBusch",
            bio: "Franz is a member of a team developing foundational Swift libraries at Apple primarily focused on networking and concurrency. Franz is also a member of the Swift Ecosystem Steering and Server working group. Before joining Apple, Franz spent a decade working in the mobile applications space.", 
            talkIDs: [12]
        ),
        Speaker(
            name: "Mads Odgaard",
            role: "Software Engineer",
            website: "https://www.madsodgaard.com/",
            bio: ComponentGroup {
                Paragraph("I am a recent graduate of Computer Science at Aarhus University, Denmark. Currently, my position is Tech Lead at Frameo. I have been coding since child, especially doing iOS development. Swift is my favourite language and I have been involved in the Server-Side Swift community for quite some years now. I am very interested in programming languages, compilers and cryptography.")
                Paragraph("Outside of coding, I love being active and playing music!")
            },
            talkIDs: [13]
        )
    ]
}


