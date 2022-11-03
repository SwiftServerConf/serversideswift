import Plot

struct ConferenceLocation: Component {
    var body: Component {
        Div {
            Div {
                Div {
                    H1("Location").class("text-center text-white")
                    H4("In the heart of London").class("text-center mb-5")
                }.class("container")
            }.class("page-block no-height bg-blue text-white")
            Div {
                Div {
                    Div {
                        Div {
                            H3("The Venue").class("h3")
                            Paragraph {
                                Text("The conference wiil take place in the heart of London in Kensington.")
                            }
                            Paragraph {
                                Text("We have an amazing location with the main conference taking place in an IMAX theatre.")
                            }
                            Paragraph {
                                Text("Please note that due to venue restictions the specific details for the venue will be sent out via email.")
                            }
                        }.class("col-xs-12 col-sm-6")
                        Div {
                            Div().class("map").id("venue-map")
                        }.class("col-xs-12 col-sm-6")
                    }.class("row")
                    Div {
                        Div {
                            H3("Transportation").class("h3")
                            Paragraph {
                                Text("The best way to get to the conference is to use the London Underground. The venue is a short walk away from South Kensington and Gloucester Road, which are on the Circle, District and Piccadilly lines.")
                            }
                            Paragraph {
                                Text("The venue is also well served by London Buses, and any bus route that goes to South Kensington is a short route away.")
                            }
                            Paragraph {
                                Text("Please note - there is no parking at the venue. We strongly recommend you use public transport.")
                            }
                        }.class("col-xs-12 col-sm-6")
                        Div {
                            Div().class("map").id("transportation-map")
                        }.class("col-xs-12 col-sm-6")
                    }.class("row mt-5")
                    Div {
                        Div {
                            H3("Hotels").class("h3")
                            Paragraph {
                                Text("There are many hotels around London to suit all budgets and any hotels that allow you to get to South Kensington or Gloucester Road Underground stations easily will work")
                            }
                            Paragraph {
                                Text("Some good options are the ")
                                Link("Best Western Mornington", url: "https://www.bestwestern.co.uk/hotels/best-western-mornington-hotel-83187").linkTarget(.blank)
                                Text(" or the ")
                                Link("Millenium Hotel London Knightsbridge", url: "https://www.millenniumhotels.com/en/london/millennium-hotel-london-knightsbridge").linkTarget(.blank)
                                Text(" with many other hotels nearby.")
                            }
                            Paragraph {
                                Text("Alternatively, check out ")
                                Link("Dorsett Shepherds Bush London", url: "https://www.dorsetthotels.com/dorsett-shepherds-bush-london/index.html").linkTarget(.blank)
                                Text(" or ")
                                Link("Novotell London West", url: "https://www.novotellondonwest.co.uk").linkTarget(.blank)
                                Text(" which are a short tube journey away from the venue.")
                            }
                        }.class("col-xs-12 col-sm-6")
                        Div {
                            Div().class("map").id("accommodation-map")
                        }.class("col-xs-12 col-sm-6")
                    }.class("row mt-5")
                }.class("container")
            }.class("page-block no-height bg-white")
        }.class("location")
    }
}
