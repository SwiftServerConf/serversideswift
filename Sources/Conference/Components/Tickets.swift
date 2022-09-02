import Plot

struct Tickets: Component {
    var body: Component {
        Div {
            Div {
                H1("Tickets").class("text-center")
                Paragraph("Please note that tickets are non-refundable, but can be re-assigned to someone else.").class("text-center")
                Wrapper {
                    Node<HTML.BodyContext>.element(named: "tito-widget", attributes: [
                        Attribute<HTML.BodyContext>(name: "event", value: "serverside-swift/2022")
                    ])
                }
            }.class("container")
        }.class("page-block no-height")
    }
}
