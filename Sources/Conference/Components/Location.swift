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
                                Node.br()
                                Text("We have an amazing location with the main conference taking place in an IMAX theatre.")
                                Node.br()
                                Text("The venue is easily reachable by public transport being a short walk away from South Kensington and Gloucester Road underground stations. which are on the Circle, District and Piccadilly lines.")
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
                                Text("The best way to get to the conference is to use the London Underground. The venue is a short walk away from South Kensington and Gloucester Road  which are on the Circle, District and Piccadilly lines.")
                                Node.br()
                                Text("We have an amazing location with the main conference taking place in an IMAX theatre.")
                                Node.br()
                                Text("The venue is easily reachable by public transport being a short walk away from South Kensington and Gloucester Road stations which are on the Circle, District and Piccadilly lines.")
                            }
                        }.class("col-xs-12 col-sm-6")
                        Div {
                            Div().class("map").id("venue-map")
                        }.class("col-xs-12 col-sm-6")
                    }.class("row mt-4")
                }.class("container")
            }.class("page-block no-height bg-white")
        }.class("location")
    }
}
