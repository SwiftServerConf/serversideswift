import Plot

struct Tickets: Component {
    var body: Component {
        Div {
            Div {
                H1("Tickets").class("text-center")
                Paragraph("Please note that tickets are non-refundable, but can be re-assigned to someone else.").class("text-center")
//                Wrapper {
//                    Node<HTML.BodyContext>.element(named: "tito-widget", attributes: [
//                        Attribute<HTML.BodyContext>(name: "event", value: "serverside-swift/2022")
//                    ])
//                }
                Div {
                    H4("Thanks to every single one of you who has bought a ticket!")
                    H6 {
                        Text("If you have any questions please don't hesitate to reach out to us ")
                        Link("here", url: "mailto:info@serversideswift.info")
                        Text("!")
                    }
                }.class("info-banner text-center mt-3")
            }.class("container tickets")
        }.class("page-block no-height text-white")
    }
}
