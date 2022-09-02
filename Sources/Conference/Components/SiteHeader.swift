import Plot
import Publish

struct SiteHeader<Site: Website>: Component {
    var context: PublishingContext<Site>
    var selectedSelectionID: Site.SectionID?

    var body: Component {
        Header {
            navigation
        }
    }

    private var navigation: Component {
        Navigation {
            Div {
                Div {
                    Link(url: "/") {
                        Image(url: "/App/YearX/images/layout/logo.png", description: "ServerSide.swift")
                    }.class("navbar-brand bg-none")
                }.class("logo")
                Button {
                    Span {
                        Span {}.class("hamburger-inner")
                    }.class("hamburger-box")
                }.class("hamburger hamburger--squeeze").attribute(named: "onclick", value: "toggleHamburger()")
                List(Site.SectionID.allCases) { sectionID in
                    let section = context.sections[sectionID]

                    if section.title == "Home" {
//                        let body: ElementComponent = {
//                            Link(section.title,
//                                url: "/"
//                            )
//                            .class(sectionID == selectedSelectionID ? "active" : "")
//                            Span().class("underline")
//                        }
//                        return body
                        return Link(section.title,
                            url: "/"
                        )
                        .class(sectionID == selectedSelectionID ? "active" : "")
                    } else if section.title == "tickets" {
                        return Link(section.title,
                            url: "/tickets"
                        )
                        .class(sectionID == selectedSelectionID ? "active" : "")
                    } else {
                        return Link(section.title,
                            url: section.path.absoluteString
                        )
                        .class(sectionID == selectedSelectionID ? "active" : "")
                    }
                }.class("d-none d-md-flex")
            }.class("container")
            List(Site.SectionID.allCases) { sectionID in
                let section = context.sections[sectionID]

                if section.title == "Home" {
                    return Link(section.title,
                        url: "/"
                    )
                    .class(sectionID == selectedSelectionID ? "active" : "")
                } else {
                    return Link(section.title,
                        url: section.path.absoluteString
                    )
                    .class(sectionID == selectedSelectionID ? "active" : "")
                }
            }.class("d-flex d-md-none")
        }.class("navigation")
    }
}
