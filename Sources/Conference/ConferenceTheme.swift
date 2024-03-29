import Plot
import Publish
import Foundation

extension Theme where Site == Conference {
    static var conference: Self {
        Theme(htmlFactory: ConferenceThemeHTMLFactory())
    }
}

private struct ConferenceThemeHTMLFactory: HTMLFactory {
    typealias Site = Conference
    
    func makeIndexHTML(for index: Index,
                       context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            buildHead(for: index, context: context),
            .body {
                SiteHeader(context: context, selectedSelectionID: nil)
                Homepage()
                SiteFooter()
                SiteScripts()
            }
        )
    }

    func makeSectionHTML(for section: Section<Site>,
                         context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            buildHead(for: section, context: context),
            .body {
                SiteHeader(context: context, selectedSelectionID: section.id)
                switch section.title {
                case "Faq":
                    FAQ()
                case "Tickets":
                    Tickets()
                case "Speakers":
                    Speakers()
                case "Sponsors":
                    Sponsors()
                case "About":
                    About()
                case "Whyattend":
                    WhyAttend()
                case "Schedule":
                    Schedule()
                case "Location":
                    ConferenceLocation()
                case "Years":
                    Years()
                case "Videos":
                    Videos()
                default:
                    Wrapper {
                        H1(section.title)
                        H1("Section")
                    }
                }
                SiteFooter()
                SiteScripts()
            }
        )
    }

    func makeItemHTML(for item: Item<Site>,
                      context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            buildHead(for: item, context: context),
            .body(
                .class("bg-blue"),
                .components {
                    SiteHeader(context: context, selectedSelectionID: item.sectionID)
                    Div(item.content.body)
                    SiteFooter()
                    SiteScripts()
                }
            )
        )
    }

    func makePageHTML(for page: Page,
                      context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            buildHead(for: page, context: context),
            .body {
                SiteHeader(context: context, selectedSelectionID: nil)
                Div {
                    Div {
                        Wrapper(page.body)
                    }.class("container pb-5")
                }.class("page-block no-height bg-blue text-white")
                SiteFooter()
                SiteScripts()
            }
        )
    }

    func makeTagListHTML(for page: TagListPage,
                         context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            buildHead(for: page, context: context),
            .body {
                SiteHeader(context: context, selectedSelectionID: nil)
                Wrapper {
                    H1("Browse all tags")
                    List(page.tags.sorted()) { tag in
                        ListItem {
                            Link(tag.string,
                                 url: context.site.path(for: tag).absoluteString
                            )
                        }
                        .class("tag")
                    }
                    .class("all-tags")
                }
                SiteFooter()
                SiteScripts()
            }
        )
    }

    func makeTagDetailsHTML(for page: TagDetailsPage,
                            context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            buildHead(for: page, context: context),
            .body {
                SiteHeader(context: context, selectedSelectionID: nil)
                Wrapper {
                    H1 {
                        Text("Tagged with ")
                        Span(page.tag.string).class("tag")
                    }

                    Link("Browse all tags",
                        url: context.site.tagListPath.absoluteString
                    )
                    .class("browse-all")
                }
                SiteFooter()
                SiteScripts()
            }
        )
    }
    
    func buildHead(for page: Location, context: PublishingContext<Conference>) -> Node<HTML.DocumentContext> {
            .head(for: page, on: context.site, stylesheetPaths: [
                "https://css.tito.io/v1.1",
                "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css",
                "https://fonts.googleapis.com/css?family=Lato:100,300, 300i,700",
                "/App/YearX/styles/layout.css",
                "/App/YearX/styles/navigation.css",
                "/App/YearX/styles/hamburger-menu.css",
                "/App/YearX/styles/footer.css",
                "/App/YearX/styles/particles.css",
                "/App/YearX/styles/Pages/home.css",
                "/App/YearX/styles/Pages/about.css",
                "/App/YearX/styles/Pages/speakers.css",
                "/App/YearX/styles/Pages/sponsors.css",
                "/App/YearX/styles/Pages/location.css",
                "/App/YearX/styles/Pages/profile.css",
                "/App/YearX/styles/Pages/years.css",
                "/App/YearX/styles/Pages/tickets.css",
                "/App/YearX/styles/Pages/schedule.css",
                "/App/YearX/styles/Pages/videos.css"
            ])
        }
}
