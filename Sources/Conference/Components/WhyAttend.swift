import Plot

struct WhyAttend: Component {
    var body: Component {
        Div {
            Div {
                H1("Reasons To Attend").class("text-center text-white")
                H4("Why should you attend ServerSide.swift 2022?").class("text-center mb-5")
                Div {
                    Div {
                        H3("Engage with the community").class("h3")
                        Paragraph("ServerSide.swift is the only international conference dedicated to server-side Swift. The conference is an amazing opportunity to network and talk to people using Swift on the server! Make connections and talk about your experiences with like-minded people. It's the one place where the entire community gets together.")
                    }.class("col-xs-12 mb-4")
                }.class("row")
                
                Div {
                    Div {
                        H3("Wide range of talks").class("h3")
                        Paragraph("Whether you're an expert on debugging Swift on Linux or you've never used Swift Package Manager you'll learn something at the conference. With beginner and advanced talks there's something for everyone.")
                    }.class("col-xs-12 mb-4")
                }.class("row")
                
                Div {
                    Div {
                        H3("Learn from the best").class("h3")
                        Paragraph {
                            Text("We've organised an amazing lineup of ")
                            Link("Speakers", url: "/speakers")
                            Text(" who are all experts in their field. There isn't another conference with such concentrated server-side Swift knowledge anywhere in the world!")
                        }
                    }.class("col-xs-12 mb-4")
                }.class("row")
                
                Div {
                    Div {
                        H3("Framework Agnostic").class("h3")
                        Paragraph("We're not focused on one particular framework so whether you're building a site with Vapor, high performance systems with NIO or using Amazon's Smoke framework, there'll be something for you.")
                    }.class("col-xs-12 mb-4")
                }.class("row")
            }.class("container")
        }.class("page-block no-height bg-blue text-white")
    }
}
