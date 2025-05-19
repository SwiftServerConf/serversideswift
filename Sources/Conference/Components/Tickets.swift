import Plot

struct Tickets: Component {
    var body: Component {
        Div {
            Div {
                H1("Tickets").class("text-center")
                Paragraph("Please note that tickets are non-refundable, but can be re-assigned to someone else.").class("text-center")
                Wrapper {
                    Node<HTML.BodyContext>.element(named: "tito-widget", attributes: [
                        Attribute<HTML.BodyContext>(name: "event", value: "serverside-swift/2025")
                    ])
                }
                Div {
                    H2("Workshop Tickets").class("text-center h3")
                    Paragraph {
                        Text("We are still finalising the details of a potential workshop/labs day, the day before the conference. This will be a separate ticket and you will still need to purchase a conference ticket to attend the conference. If you wish to attend the workshop we suggest you buy a conference ticket now (to make the most of the early bird pricing) but hold off on booking travel and accommodation until we confirm the workshop details.")
                    }
                }
                // Div {
                // //    H4("Thanks to every single one of you who has bought a ticket!")
                //     H4("Tickets will be released soon!")
                //     H6 {
                //         Text("If you have any questions please don't hesitate to reach out to us ")
                //         Link("here", url: "mailto:info@serversideswift.info")
                //         Text("!")
                //     }
                // }.class("info-banner text-center mt-3")
            }.class("container tickets")
        }.class("page-block no-height text-white")
    }
}
