import Plot

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
                                if speaker.github != nil {
                                    Link(url: speaker.github!) {
                                        Span {
                                            SVG(url: "/App/YearX/images/icons/feather-sprite.svg#github").class("feather")
                                        }.class("icon")
                                    }
                                }
                                if speaker.github != nil {
                                    Link(url: speaker.twitter!) {
                                        Span {
                                            SVG(url: "/App/YearX/images/icons/feather-sprite.svg#twitter").class("feather")
                                        }.class("icon")
                                    }
                                }
                            }
                            .class("social-media")
                        }
                        .class("head")
                        Div {
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
