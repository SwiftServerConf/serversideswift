import Plot
import Publish

struct SiteFooter: Component {
    var body: Component {
        Footer {
            Paragraph {
                Text("Copyright © Vapor")
            }
            Paragraph {
                Link("RSS feed", url: "/feed.rss")
            }
        }
    }
}
