import Plot

struct About: Component {
    var body: Component {
        Div {
            Div {
                Div {
                    H1("About").class("text-center")
                    H4(" ServerSide.swift is solely run for the love of server-side Swift.").class("text-center mb-5")
                    Div {
                        Div {
                            Link("", url: "https://www.twitter.com/0xtim").linkTarget(.blank)
                            Div {
                                Image(url: "/App/YearX/images/team/timcondon-new.png", description: "Tim")
                            }.class("image")
                            Div {
                                H3("Tim Condon").class("h3")
                                H4("Vapor Core Team & Founder of Broken Hands").class("f-weight-300")
                            }.class("description p-2")
                        }.class("organizer")
                    }.class("organizer-list row")
                }.class("container")
            }.class("page-block no-height bg-blue text-white")
            
            Div {
                Div {
                    H3("The Conference").class("h3")
                    Node.br()
                    Paragraph {
                        Text("ServerSide.swift is a framework-independent, server-side Swift conference, to bring all of the community toghether to learn and share. The conference is aimed at being a non-profit conference and solely run for the love of server-side Swift. We've had a number of successful editions and are looking foward to putting on another incredible event to help grow Swift on the server!")
                    }.class("f-weight-300")
                    Paragraph {
                        Text("The conference is a unique place to showcase a wide range of talks from the internals of Swift to success stories from across the industry. Every year we have highly technical talks you'll see at no other conference. We've even had fundamental changes in Swift, such as the new Open Source Foundation announced at the conference.")
                    }.class("f-weight-300")
                    H3("Getting In Touch").class("h3")
                    Paragraph {
                        Text("For general ")
                        Text("questions and requests").bold()
                        Text(" please email ")
                        Link("info@serversideswift.info", url: "mailto:info@serversideswift.info")
                        Text(". For anything related to sponsoring the conference, please reach out to us at ")
                        Link("sponsors@serversideswift.info", url: "mailto:sponsors@serversideswift.info")
                        // Text(". If you're interested in talking, please submit a talk through the ")
                        // Text("CFP").bold()
                        // Text(" form ")
                        // Link("here", url: "https://forms.gle/tWMWZpChcuPL6q2C8")
                        Text(". You are also welcome to reach out to us through the social media channels at the bottom or using our individual Twitter handles.")
                    }
                }.class("container")
            }.class("page-block no-height bg-white")
        }.class("about")
    }
}
