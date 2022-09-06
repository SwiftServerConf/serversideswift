import Plot
import Publish

struct SiteHeader<Site: Website>: Component {
    var context: PublishingContext<Site>
    var selectedSelectionID: Site.SectionID?
    
    init(context: PublishingContext<Site>, selectedSelectionID: Site.SectionID?) {
        self.context = context
        self.selectedSelectionID = selectedSelectionID
    }
    
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
                    var faq: Component = ListItem {
                        Link("FAQ", url: "/faq")
                        Span().class("underline")
                    }
                    if let currentSection = currentSection, let currentSectionID = currentSection.id as? Conference.SectionID, currentSectionID == Conference.SectionID.faq {
                        faq = faq.class("active")
                    }
                    var tickets = ListItem {
                        Link("Tickets", url: "/tickets")
                        Span().class("underline")
                    }.class("buy-ticket")
                    if let currentSection = currentSection, let currentSectionID = currentSection.id as? Conference.SectionID, currentSectionID == Conference.SectionID.tickets {
                        tickets = tickets.class("active")
                    }
                    return ComponentGroup {
                        home
                        faq
                        tickets
                    }
                }.class("d-none d-md-flex")
            }.class("container")
            List {
                let home = ListItem {
                    Link("Home", url: "/")
                    Span().class("underline")
                }
                var faq: Component = ListItem {
                    Link("FAQ", url: "/faq")
                    Span().class("underline")
                }
                if let currentSection = currentSection, let currentSectionID = currentSection.id as? Conference.SectionID, currentSectionID == Conference.SectionID.faq {
                    faq = faq.class("active")
                }
                
                var tickets = ListItem {
                    Link("Tickets", url: "/tickets")
                    Span().class("underline")
                }.class("buy-ticket")
                if let currentSection = currentSection, let currentSectionID = currentSection.id as? Conference.SectionID, currentSectionID == Conference.SectionID.tickets {
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
