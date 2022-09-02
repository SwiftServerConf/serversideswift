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
        
        let currentSection: Section<Site>?
        if let selected = selectedSelectionID {
            currentSection = context.sections[selected]
        } else {
            currentSection = nil
        }
        return Navigation {
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
                List {
                    let home = ListItem {
                        Link("Home", url: "/")
                        Span().class("underline")
                    }
                    let faq = ListItem {
                        Link("FAQ", url: "/faq")
                        Span().class("underline")
                    }
                    var tickets = ListItem {
                        Link("Tickets", url: "/tickets")
                        Span().class("underline")
                    }.class("buy-ticket")
                    if currentSection?.title == "Ticket" {
                        tickets = tickets.class("active")
                    }
                    return ComponentGroup {
                        home
                        faq
                        tickets
                    }
                }.class("d-none d-md-flex")
            }.class("container")
            //            List(Site.SectionID.allCases) { sectionID in
            //                let section = context.sections[sectionID]
            //
            //                if section.title == "Home" {
            //                    return Link(section.title,
            //                                url: "/"
            //                    )
            //                    .class(sectionID == selectedSelectionID ? "active" : "")
            //                } else {
            //                    return Link(section.title,
            //                                url: section.path.absoluteString
            //                    )
            //                    .class(sectionID == selectedSelectionID ? "active" : "")
            //                }
            List {
                let home = ListItem {
                    Link("Home", url: "/")
                    Span().class("underline")
                }
                let faq = ListItem {
                    Link("FAQ", url: "/faq")
                    Span().class("underline")
                }
                var tickets = ListItem {
                    Link("Tickets", url: "/tickets")
                    Span().class("underline")
                }.class("buy-ticket")
                if currentSection?.title == "Ticket" {
                    tickets = tickets.class("active")
                }
                return ComponentGroup {
                    home
                    faq
                    tickets
                }
            }.class("d-flex d-md-none")
        }.class("navigation")
    }
}
