import Plot
import Foundation

struct Speakers: Component {
    var body: Component {
        Div {
            Div {
                Div {
                    H1("Speakers")
                        .class("text-center")
                    H4("We host a diverse selection of inspiring speakers.")
                        .class("text-center mb-5")
                    SpeakerList<Conference>(speakers: AllSpeakers.speakers)
                }.class("container")
                Div {
                    H1("Lightning Talk Speakers")
                        .class("text-center")
                    H4("This year we have a range of lightning talks as well!")
                        .class("text-center mb-5")
                    SpeakerList<Conference>(speakers: AllSpeakers.lightningSpeakers)
                }.class("container")
                Div().id("particles-js")
            }.class("page-block bg-blue text-white")
            Div {
                Div {
                    Div {
                        H3("Call For Proposals")
                            .class("h3 text-center")
                        Paragraph(" Call for proposals are now open! We're so excited to invite every interested speaker and/or workshop organizer to submit a talk/workshop through our form below. ")
                            .class("text-center")
                        Paragraph(
                            Link("Submit Talk", url: URL(string: "https://forms.gle/tWMWZpChcuPL6q2C8")!)
                                .class("btn btn-default btn-gradient"))
                            .class("text-center")
                    }.class("col")
                }.class("container")
            }.class("cfp page-block no-height bg-white")
        }
        .class("speakers")
    }
}
