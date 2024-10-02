import Plot

struct Videos: Component {
    var body: Component {
        Div {
            Div {
                Div {
                    /** Current year videos **/
                    H1("Videos").class("text-center text-white mb-4")
                    H4("Watch all the amazing content from the conference.").class(
                        "text-center mb-5")
                    Div {
                        for talk in AllTalks.talks.sorted(by: { $0.order < $1.order }) where talk.youtubeVideoID != nil {
                            Div {
                                Div {
                                    Div {
                                        IFrame(
                                            url: "https://www.youtube.com/embed/\(talk.youtubeVideoID!)",
                                            addBorder: false, allowFullScreen: true,
                                            enabledFeatureNames: ["autoplay", "encrypted-media"])
                                    }.class("embed-container")
                                }.class("video")
                                Div {
                                    H3(talk.title).class("h3")
                                    List {
                                        for speaker in talk.speakers {
                                            ListItem {
                                                H4 {
                                                    Link(speaker.name, url: "/speakers/\(speaker.url)/")
                                                }.class("f-weight-300")
                                            }
                                        }
                                    }.class("speaker-list")
                                }.class("description p-2")
                            }.class("card")
                        }
                    }.class("list")
                    // H4("More videos coming soon...").class("text-center mb-5")

                    H4 {
                        Text("To see videos from previous editions ")
                        Link("choose a year", url: "/years")
                        Text(".")
                    }.class("text-center mt-4")
                }.class("container")
            }.class("page-block no-height bg-blue text-white")
        }.class("videos")
    }
}
