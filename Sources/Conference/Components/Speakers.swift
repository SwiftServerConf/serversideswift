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
                    H4("More speakers to be announced soon!")
                            .class("text-center mb-5")
                }.class("container")
//                Div {
//                    H1("Lightning Talk Speakers")
//                        .class("text-center")
//                    H4("This year we have a range of lightning talks as well!")
//                        .class("text-center mb-5")
//                    SpeakerList<Conference>(speakers: AllSpeakers.lightningSpeakers)
//                }.class("container")
//                Div().id("particles-js")
//            }.class("page-block bg-blue text-white")
        }.class("bg-blue text-white mt-5")
            Div {
                Div {
                    Div {
                        H3("Call For Proposals")
                            .class("h3 text-center")
                       Paragraph("Our CFP is now closed - please check back next year!")
                           .class("text-center")
                        // Paragraph {
                        //     Text("If you'd like to speak at this years ServerSide.swift, please apply via our CFP. We welcome and encourage talks from all abilities!")
                        // }.class("text-center")
                        // Div {
                        //     Link("Apply To Speak", url: "https://www.papercall.io/server-side-swift-2024").linkTarget(.blank).class("btn btn-default btn-gradient")
                        // }.class("action-buttons pt-3 pb-3 text-center")
                    }.class("col")
                }.class("container")
            }.class("cfp page-block no-height bg-white")
        }
        .class("speakers")
    }
}
