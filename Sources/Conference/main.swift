import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct Conference: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case home
//        case coc
        case faq
        case speakers
        case sponsors
//        case location
        case tickets
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://www.serversideswift.info")!
    var name = "ServerSide.swift Conference"
    var description = "ServerSide.swift - the conference for server-side Swift developers"
    var language: Language { .english }
    var imagePath: Path? {
        "/App/YearX/images/layout/logo.png"
    }
    var favicon: Favicon? {
        Favicon(path: "/App/YearX/favicon.ico", type: "image/x-icon")
    }
}

// Creates a list with all speaker detail pages and adds them to the speakers section
var items: [Item<Conference>] = AllSpeakers.speakers.map { speaker in
    Item<Conference>(
        path: Path(speaker.url),
        sectionID: .speakers,
        metadata: Conference.ItemMetadata(),
        tags: [],
        content: Content(
            title: speaker.name,
            body: Content.Body(node: SpeakerDetail(speaker: speaker).body.convertToNode())
        )
    )
}

try Conference().publish(
    withTheme: .conference,
    additionalSteps: [
        .addItems(in: items),
    ]
)
