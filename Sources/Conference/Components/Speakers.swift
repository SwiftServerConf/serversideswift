import Plot
import Foundation

struct Speakers: Component {
    var body: Component {
        Div {
            Div {
                Div {
                    H1("Speakers")
                        .class("text-center")
                    H2("Emcee").class("text-center h2")
                    Div {
                        SpeakerOverview(speaker: AllSpeakers.emcee)
                    }.class("d-flex justify-content-center")

                    H2("Workshop Instructors").class("text-center h2")
                    H5("Coming Soon").class("text-center h5")
                    H2("Conference Speakers").class("text-center h2 mt-4")
                    H5("We host a diverse selection of inspiring speakers.")
                        .class("text-center mb-5")
                    // SpeakerList<Conference>(speakers: AllSpeakers.speakers)
                    H4("Speakers to be announced soon!")
                            .class("text-center mb-5")
                }.class("container")
        }.class("bg-blue text-white mt-5")
            Div {
                Div {
                    Div {
                        H3("Call For Proposals")
                            .class("h3 text-center")
                       Paragraph("Our CFP is now closed - please check back next year!")
                           .class("text-center")
                        // Paragraph("Our CFP will be open soon, please check back later!")
                        //    .class("text-center")
                        // Paragraph {
                        //     Text("If you'd like to speak at this years ServerSide.swift, please apply via our CFP. We welcome and encourage talks from all abilities!")
                        // }.class("text-center")
                        // Div {
                        //     Link("Apply To Speak", url: "https://www.papercall.io/serversideswift-2025").linkTarget(.blank).class("btn btn-default btn-gradient")
                        // }.class("action-buttons pt-3 pb-3 text-center")
                    }.class("col")
                }.class("container")
            }.class("cfp page-block no-height bg-white")
        }
        .class("speakers")
    }
}
