import Plot
import Publish

struct SiteHeader<Site: Website>: Component {
    var context: PublishingContext<Site>
    var selectedSelectionID: Site.SectionID?

    var body: Component {
        Header {
            Wrapper {
                Node.a(
                    .href("/"),
                    .img(.alt("Vapor Logo"), .src("/static/images/header-logo.png"), .class("d-iblock va-baseline")),
                    .h1("The Vapor Blog", .class("d-iblock ml-4 va-text-bottom"))
                ).class("site-name d-iblock")

                if Site.SectionID.allCases.count > 1 {
                    navigation
                }
            }
        }
    }

    private var navigation: Component {
        Navigation {
            List(Site.SectionID.allCases) { sectionID in
                let section = context.sections[sectionID]

                return Link(section.title,
                    url: section.path.absoluteString
                )
                .class(sectionID == selectedSelectionID ? "selected" : "")
            }
        }
    }
}
