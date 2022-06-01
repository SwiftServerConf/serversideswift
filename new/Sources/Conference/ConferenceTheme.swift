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
                Wrapper {
                    H1(index.title)
                    Paragraph(context.site.description)
                        .class("description")
                }
                SiteFooter()
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
                Wrapper {
                    H1(section.title)
                }
                SiteFooter()
            }
        )
    }

    func makeItemHTML(for item: Item<Site>,
                      context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            buildHead(for: item, context: context),
            .body(
                .class("item-page"),
                .components {
                    SiteHeader(context: context, selectedSelectionID: item.sectionID)
                    Wrapper {
                        Article {
                            Div(item.content.body).class("content")
                            Span("Tagged with: ")
                        }
                    }
                    Script(url: "/static/scripts/syntax.js")
                    Script(url: "/static/scripts/start-syntax.js")
                    SiteFooter()
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
                Wrapper(page.body)
                SiteFooter()
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
            }
        )
    }
    
    func buildHead(for page: Location, context: PublishingContext<Conference>) -> Node<HTML.DocumentContext> {
            .head(for: page, on: context.site, stylesheetPaths: [
                "/static/styles/styles.css",
                "/static/styles/syntax.css"
            ])
        }
}
