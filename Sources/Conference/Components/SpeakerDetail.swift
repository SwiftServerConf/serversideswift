import Plot
import Foundation

struct SpeakerDetail: Component {
    let speaker: Speaker
    
    var body: Component {
        Div {
            Div().id("particles-js")
            Div {
                Div {
                    Div {
                        Image(url: speaker.image, description: speaker.name)
                    }
                    .class("image")
                    Div {
                        Div {
                            H3(speaker.name)
                            Div {
                                if let githubURL = speaker.github {
                                    Link(url: githubURL) {
                                        Span {
                                            SVG(url: "/App/YearX/images/icons/feather-sprite.svg#github")
                                                .class("feather")
                                        }.class("icon")
                                    }
                                }
                                if let twitterURL = speaker.twitter {
                                    Link(url: twitterURL) {
                                        Span {
                                            SVG(url: "/App/YearX/images/icons/feather-sprite.svg#twitter")
                                                .class("feather")
                                        }.class("icon")
                                    }
                                }
                            }
                            .class("social-media")
                        }
                        .class("head")
                        Div {
                            if let talk = speaker.talks.first {
                                Node.hr()
                                H3("Talk Details")
                                Div {
                                    H4("Title").class("f-gradient")
                                    H6(talk.title)
                                        .class("f-weight-300")
                                }
                                .class("section")
                                Div {
                                    H4("Description").class("f-gradient")
                                    H6(talk.description)
                                        .class("f-weight-300")
                                }
                                .class("section")
                                if let eventSpecifics = talk.eventSpecifics {
                                    Div {
                                        H4("Time and Place").class("f-gradient")
                                        H6("\(eventSpecifics.startTime.formatted()) in \(eventSpecifics.place)")
                                            .class("f-weight-300")
                                    }
                                    .class("section")
                                }
                            }
                            Node.hr()
                            H3("About the Speaker")
                            Div {
                                H4("Position").class("f-gradient")
                                H6("\(speaker.role) at \(speaker.company)")
                                    .class("f-weight-300")
                            }
                            .class("section")
                            Div {
                                H4("Bio").class("f-gradient")
                                H6(speaker.bio)
                                    .class("f-weight-300")
                            }
                            .class("section")
                        }
                        .class("body")
                    }
                    .class("description p-3")
                }
                .class("card")
            }
            .class("container")
        }
        .class("page-block profile")
    }
}
