import Plot
import Foundation

struct Sponsors: Component {
    var body: Component {
        Div {
            Div {
                Div {
                    H1("Sponsors")
                        .class("text-center f-gradient")
                    H4("Thank you to all of our amazing sponsors for helping us run the conference!")
                        .class("text-center mb-5")
                    Div {
                        Link("Become a Sponsor", url: "mailto:sponsors@serversideswift.info")
                            .class("btn btn-default btn-gradient")
                    }.class("action-buttons")
                }
                .class("container")
            }
            .class("sponsors bg-white")
            Div {
                Div {
                    platinumSponsors()
                    goldSponsors()
                    bronzeSponsors()
                }
                .class("container")
            }
            .class("sponsors page-block bg-blue")
        }
    }
    
    func platinumSponsors() -> Component {
        Div {
            Div {
                H3("PLATINUM").class("f-platinum text-center pt-2 pb-3")
            }.class("col-12")
            Div {
                Div {
                    Div {
                        Link("", url: "https://www.brokenhands.io").linkTarget(.blank)
                        Div {
                            Image(url: "/App/YearX/images/sponsors/brokenhands.svg", description: "Broken Hands")
                        }.class("image")
                        Div {
                            H4("Broken Hands")
                        }.class("description p-2")
                    }.class("sponsor")
                }.class("platinum")
            }.class("col-12 col-sm-6 col-md-4")
            Div {
                Div {
                    Div {
                        Link("", url: "https://www.apple.com").linkTarget(.blank)
                        Div {
                            Image(url: "/App/YearX/images/sponsors/apple.svg", description: "Apple, Inc.").class("apple-logo d-block mx-auto")
                        }.class("image text-center")
                        Div {
                            H4("Apple")
                        }.class("description p-2")
                    }.class("sponsor")
                }.class("platinum")
            }.class("col-12 col-sm-6 col-md-4")
            Div {
                Div {
                    Div {
                        Link("", url: "mailto:sponsors@serversideswift.info")
                        Div {
                            Image(url: "/App/YearX/images/sponsor-levels/sponsor_platinum.png", description: "Platinum")
                        }.class("image")
                        Div {
                            H4("FREE SPOT").class("f-platinum")
                        }.class("description p-2")
                    }.class("sponsor opacity-15")
                }.class("platinum")
            }.class("col-12 col-sm-6 col-md-4")
        }.class("sponsor-list row")
    }
    
    func goldSponsors() -> Component {
        Div {
            Div {
                H3("GOLD").class("f-gold text-center pt-2 pb-3")
            }.class("col-12")
            Div {
                Div {
                    Div {
                        Link("", url: "mailto:sponsors@serversideswift.info")
                        Div {
                            Image(url: "/App/YearX/images/sponsor-levels/sponsor_gold.png", description: "Gold")
                        }.class("image")
                        Div {
                            H4("FREE SPOT").class("f-gold")
                        }.class("description p-2")
                    }.class("sponsor opacity-15")
                }.class("gold")
            }.class("col-12 col-sm-6 col-md-4 col-lg-3")
            Div {
                Div {
                    Div {
                        Link("", url: "mailto:sponsors@serversideswift.info")
                        Div {
                            Image(url: "/App/YearX/images/sponsor-levels/sponsor_gold.png", description: "Gold")
                        }.class("image")
                        Div {
                            H4("FREE SPOT").class("f-gold")
                        }.class("description p-2")
                    }.class("sponsor opacity-15")
                }.class("gold")
            }.class("col-12 col-sm-6 col-md-4 col-lg-3")
            Div {
                Div {
                    Div {
                        Link("", url: "mailto:sponsors@serversideswift.info")
                        Div {
                            Image(url: "/App/YearX/images/sponsor-levels/sponsor_gold.png", description: "Gold")
                        }.class("image")
                        Div {
                            H4("FREE SPOT").class("f-gold")
                        }.class("description p-2")
                    }.class("sponsor opacity-15")
                }.class("gold")
            }.class("col-12 col-sm-6 col-md-4 col-lg-3")
            Div {
                Div {
                    Div {
                        Link("", url: "mailto:sponsors@serversideswift.info")
                        Div {
                            Image(url: "/App/YearX/images/sponsor-levels/sponsor_gold.png", description: "Gold")
                        }.class("image")
                        Div {
                            H4("FREE SPOT").class("f-gold")
                        }.class("description p-2")
                    }.class("sponsor opacity-15")
                }.class("gold")
            }.class("col-12 col-sm-6 col-md-4 col-lg-3")
        }.class("sponsor-list row")
    }
    
    func bronzeSponsors() -> Component {
        Div {
            Div {
                H3("BRONZE").class("f-bronze text-center pt-2 pb-3")
            }.class("col-12")
            Div {
                Div {
                    Div {
                        Link("", url: "https://bluem.nl/en/").linkTarget(.blank)
                        Div {
                            Image(url: "/App/YearX/images/sponsors/bluem.png", description: "Bluem").id("bluem-sponsor-logo-img")
                        }.class("image").id("bluem-sponsor-logo")
                        Div {
                            H4("Bluem")
                        }.class("description p-2")
                    }.class("sponsor")
                }.class("bronze")
            }.class("col-12 col-sm-6 col-md-4 col-lg-3")
            Div {
                Div {
                    Div {
                        Link("", url: "https://tuparev.com/").linkTarget(.blank)
                        Div {
                            Image(url: "/App/YearX/images/sponsors/tuparev2024.png", description: "Tuparev Technologies")
                        }.class("image")
                        Div {
                            H4("Tuparev Technologies")
                        }.class("description p-2")
                    }.class("sponsor")
                }.class("bronze")
            }.class("col-12 col-sm-6 col-md-4 col-lg-3")
            Div {
                Div {
                    Div {
                        Link("", url: "mailto:sponsors@serversideswift.info")
                        Div {
                            Image(url: "/App/YearX/images/sponsor-levels/sponsor_bronze.png", description: "Bronze")
                        }.class("image")
                        Div {
                            H4("FREE SPOT").class("f-bronze")
                        }.class("description p-2")
                    }.class("sponsor opacity-15")
                }.class("bronze")
            }.class("col-12 col-sm-6 col-md-4 col-lg-3")
            Div {
                Div {
                    Div {
                        Link("", url: "mailto:sponsors@serversideswift.info")
                        Div {
                            Image(url: "/App/YearX/images/sponsor-levels/sponsor_bronze.png", description: "Bronze")
                        }.class("image")
                        Div {
                            H4("FREE SPOT").class("f-bronze")
                        }.class("description p-2")
                    }.class("sponsor opacity-15")
                }.class("bronze")
            }.class("col-12 col-sm-6 col-md-4 col-lg-3")
        }.class("sponsor-list row")
    }
}
