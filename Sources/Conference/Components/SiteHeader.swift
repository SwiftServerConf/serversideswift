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
                    return buildNavComponents(currentSection: currentSection)
                }.class("d-none d-md-flex")
            }.class("container")
            List {
                return buildNavComponents(currentSection: currentSection)
            }.class("d-flex d-md-none")
        }.class("navigation")
    }
    
    private func buildNavComponents(currentSection: Section<Site>?) -> ComponentGroup {
        let home = buildNavComponent(for: .home, currentSection: currentSection)
        let faq = buildNavComponent(for: .faq, currentSection: currentSection)
        let tickets = buildNavComponent(for: .tickets, currentSection: currentSection)
        let speakers = buildNavComponent(for: .speakers, currentSection: currentSection)
        let sponsors = buildNavComponent(for: .sponsors, currentSection: currentSection)
        let schedule = buildNavComponent(for: .schedule, currentSection: currentSection)
        let location = buildNavComponent(for: .location, currentSection: currentSection)
        let whyAttend = buildNavComponent(for: .whyAttend, currentSection: currentSection)
        let about = buildNavComponent(for: .about, currentSection: currentSection)
        return ComponentGroup {
            home
            schedule
            speakers
            location
            sponsors
            faq
            whyAttend
            about
            tickets
        }
    }
    
    private func buildNavComponent(for section: Conference.SectionID, currentSection: Section<Site>?) -> Component {
        var component: Component = ListItem {
            buildLink(for: section)
            Span().class("underline")
        }
        if section == .tickets {
            component = component.class("buy-ticket")
        }
        if section != .home {
            if let currentSection = currentSection, let currentSectionID = currentSection.id as? Conference.SectionID, currentSectionID == section {
                component = component.class("active")
            }
        }
        return component
    }
    
    private func buildLink(for section: Conference.SectionID) -> Link {
        switch section {
        case .faq:
            return Link("FAQ", url: "/faq")
        case .tickets:
            return Link("Tickets", url: "/tickets")
        case .speakers:
            return Link("Speakers", url: "/speakers")
        case .sponsors:
            return Link("Sponsors", url: "/sponsors")
        case .home:
            return Link("Home", url: "/")
        case .about:
            return Link("About", url: "/about")
        case .location:
            return Link("Location", url: "/location")
        case .whyAttend:
            return Link("Why Attend?", url: "/whyAttend")
        case .schedule:
            return Link("Schedule", url: "/schedule")
        }
    }
}
