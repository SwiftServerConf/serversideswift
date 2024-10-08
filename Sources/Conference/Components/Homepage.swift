import Plot

struct Homepage: Component {
    var body: Component {
        ComponentGroup {
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
                    Text("26th-27th September 2024. London, UK")
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
                                Text("26th and 27th of September").bold()
                                Text(" in the awesome ")
                                Text("Science Museum in London, UK").bold()
                                Text(", and it will be packed with inspiring talks.")
                            }
                        }.class("col-12 col-sm-6 mt-2 mb-2")
                        
                        Div {
                            H3 {
                                Text("Speakers")
                            }.class("h3")
                            Paragraph {
                                Text("We'll have a packed schedule full of amazing talks from some amazing speakers. ")
                                Link("Take a look!", url: "/schedule")
                                Text(" at the current schedule.")
                            }
                            // Paragraph {
                            //     Text("If you'd like to speak, you can ")
                            //     Link("apply via our CFP", url: "https://www.papercall.io/server-side-swift-2024").linkTarget(.blank)
                            //     Text(".")
                            // }
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
            }.class("page-block description bg-white")
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
                            H2("Sponsors").class("h2 text-center")
                            Node.hr()
                            H3("Platinum Sponsors").class("h3 text-center")
                            Div {
                                Link(url: "https://www.brokenhands.io") {
                                    Image(url: "/App/YearX/images/sponsors/brokenhands.svg", description: "Broken Hands").class("h-90 pr-3 pt-2")
                                }.linkTarget(.blank)
                                Link(url: "https://www.apple.com") {
                                    Image(url: "/App/YearX/images/sponsors/apple.svg", description: "Apple Inc.").class("h-90 pl-3")
                                }.linkTarget(.blank)
                            }.class("logos")
                            Node.hr()
//                            H3("Gold Sponsors").class("h3 text-center")
//                            Div {
//                                Link(url: "https://responsive.software/") {
//                                    Image(url: "/App/YearX/images/sponsors/responsive-software.svg", description: "Responsive Software").class("h-60")
//                                }.linkTarget(.blank)
//                                Link(url: "https://profoto.com/int/ecommerce-studio-solutions") {
//                                    Image(url: "/App/YearX/images/sponsors/profoto.png", description: "Styleshoots").class("h-30")
//                                }.linkTarget(.blank)
//                            }.class("logos")
//                            Node.hr()
                           H3("Bronze Sponsors").class("h3 text-center")
                           Div {
                               Link(url: "https://tuparev.com/") {
                                   Image(url: "/App/YearX/images/sponsors/tuparev2024.png", description: "Tuparev Technologies").class("h-40")
                               }.linkTarget(.blank)
                               Link(url: "https://bluem.nl/en/") {
                                   Image(url: "/App/YearX/images/sponsors/bluem.png", description: "Bluem").class("h-40")
                               }.linkTarget(.blank)
                           }.class("logos")
                        }.class("col")
                    }.class("row")
                }.class("container")
            }.class("sponsors bg-white")
        }
    }
}
