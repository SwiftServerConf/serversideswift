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
                Div {
                    Div().id("particles-js")
                    Div {
                        Image(url: "/App/YearX/images/layout/logo.png", description: "ServerSide.swift logo")
                            .attribute(named: "height", value: "130px")
                            .attribute(named: "width", value: "auto")
                        H2 {
                            Text("ServerSide.swift")
                        }.class("text-center ff-monofur")
                    }.class("brand")
                    H1 {
                        Text("Server-Side Swift Conference")
                    }.class("text-center text-white")
                    H2 {
                        Text("9th December 2022. London, UK")
                    }.class("text-center text-white")
                    Div {
                        Link("Become a Sponsor", url: "mailto:sponsors@serversideswift.info").class("btn btn-default btn-gradient")
                        Link("Buy a Ticket", url: "/tickets").class("btn btn-default btn-gradient ml-3")
                    }.class("action-buttons pt-5 pb-3")
                }.class("page-block bg-blue hero")
                Div {
                    Div {
                        Div {
                            Div {
                                H3 {
                                    Text("The Conference")
                                }.class("h3")
                                Paragraph("ServerSide.swift is a framework-independent conference, where we will learn and share on a number of different related topics. The conference is aimed at being a non-profit conference and solely run for the love of server-side Swift.")
                            }.class("col-12 col-sm-6 mt-2 mb-2")
                            
                            Div {
                                H3 {
                                    Text("Where and When")
                                }.class("h3")
                                Paragraph {
                                    Text("The conference will take place on the ")
                                    Text("9th of December").bold()
                                    Text(" in the awesome ")
                                    Text("London, UK").bold()
                                    Text(", and it will be packed with inspiring talks.")
                                }
                            }.class("col-12 col-sm-6 mt-2 mb-2")
                            
                            Div {
                                H3 {
                                    Text("Speakers")
                                }.class("h3")
                                Paragraph {
                                    Text("We are currently putting together an interesting array of talks from some amazing speakers. If you'd like to take part, you ")
                                    Link("can submit a talk here", url: "https://forms.gle/tWMWZpChcuPL6q2C8").linkTarget(.blank)
                                    Text(".")
                                }
                            }.class("col-12 col-sm-6 mt-2 mb-2")
                            
                            Div {
                                H3 {
                                    Text("The Team")
                                }.class("h3")
                                Paragraph {
                                    Text("The conference is organised by ")
                                    Link("Tim Condon", url: "https://twitter.com/0xTim").linkTarget(.blank)
                                    Text(" and helped by a number of volunteers. If you'd like to volunteer to help out at the conference, ")
                                    Link("please get in touch", url: "mailto:info@serversideswift.info")
                                    Text("!")
                                }
                            }.class("col-12 col-sm-6 mt-2 mb-2")
                            
                            Div {
                                H3 {
                                    Text("Sponsoring")
                                }.class("h3")
                                Paragraph {
                                    Text("We are currently looking for sponsors so if you work for a company that would want to help sponsor ServerSide.swift then please get in contact at ")
                                    Link("sponsors@serversideswift.info", url: "mailto:sponsors@serversideswift.info")
                                    Text(".")
                                }
                            }.class("col-12 col-sm-6 mt-2 mb-2")
                            
                            Div {
                                H3 {
                                    Text("Want to help?")
                                }.class("h3")
                                Paragraph {
                                    Text("As we are a non-profit conference then the best way you can help at the moment is by spreading the word! Feel free to share the link on whatever platforms that you like. If you'd like to volunteer at the conference then ")
                                    Link("please get in touch", url: "mailto:info@serversideswift.info")
                                    Text("!")
                                }
                            }.class("col-12 col-sm-6 mt-2 mb-2")
                        }.class("row")
                    }.class("container")
                }.class("page-block description")
                Div {
                    Div {
                        Div {
                            Div {
                                H3("Newsletter").class("h3 text-center")
                                Paragraph("The best way to keep posted about the conference is by signing up below! Future newsletters will contain everything about sponsor levels, ticket prices, schedule and more!").class("text-white text-center")
                                Form(url: "https://serversideswift.us17.list-manage.com/subscribe/post?u=214a68ae1b6b77f2b00664b9c&amp;id=3eb6684609", method: .post, enableValidation: false) {
                                    Paragraph {
                                        Input(type: .email, name: "EMAIL", value: "", placeholder: "Enter your email").class("form-control").id("mce-EMAIL")
                                    }
                                    Div {
                                        Input(type: .text, name: "b_214a68ae1b6b77f2b00664b9c_3eb6684609", value: "").attribute(named: "tabindex", value: "-1")
                                    }.style("position: absolute; left: -5000px;").attribute(named: "aria-hidden", value: "true")
                                    Paragraph {
                                        Input(type: .submit, name: "subscribe", value: "Notify Me").id("mc-embedded-subscribe").class("btn btn-default submit")
                                    }.class("text-center")
                                }.linkTarget(.blank).class("validate col-12 col-sm-8 ml-auto mr-auto mt-4").id("mc-embedded-subscribe-form").attribute(named: "name", value: "mc-embedded-subscribe-form")
                            }.class("col")
                        }.class("row")
                    }.class("container")
                }.class("bg-blue newsletter")
                Div {
                    Div {
                        Div {
                            Div {
                                H3("Sponsors").class("h3 text-center")
                                Div {
                                    Link(url: "https://www.brokenhands.io") {
                                        Image(url: "/App/YearX/images/sponsors/brokenhands.svg", description: "Broken Hands").class("h-80")
                                    }.linkTarget(.blank)
                                }.class("logos")
                            }.class("col")
                        }.class("row")
                    }.class("container")
                }.class("sponsors")
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
                if section.title == "Faq" {
                    FAQ()
                } else {
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
                .class("item-page"),
                .components {
                    SiteHeader(context: context, selectedSelectionID: item.sectionID)
                    Wrapper {
                        Article {
                            Div(item.content.body).class("content")
                            Span("Tagged with: ")
                        }
                    }
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
