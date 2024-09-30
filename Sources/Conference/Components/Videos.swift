import Plot

struct Videos: Component {
    var body: Component {
        Div {
            Div {
                Div {
                    /** Current year videos **/
                   H1("Videos").class("text-center text-white mb-4")
                   H4("Watch all the amazing content from the conference.").class("text-center mb-5")
                   Div {
                       Div {
                           Div {
                               Div {
                                   IFrame(url: "https://www.youtube.com/embed/FuTpnddLhpU", addBorder: false, allowFullScreen: true, enabledFeatureNames: ["autoplay", "encrypted-media"])
                               }.class("embed-container")
                           }.class("video")
                           Div {
                               H3("Generating static websites using Swift on the server").class("h3")
                               List {
                                ListItem {
                                    H4 {
                                        Link("Tibor Bödecs", url: "/speakers/tibor-bodecs/")
                                    }.class("f-weight-300")
                                }
                               }.class("speaker-list")
                           }.class("description p-2")
                       }.class("card")

                       Div {
                           Div {
                               Div {
                                   IFrame(url: "https://www.youtube.com/embed/QFuZq9PHkTo", addBorder: false, allowFullScreen: true, enabledFeatureNames: ["autoplay", "encrypted-media"])
                               }.class("embed-container")
                           }.class("video")
                           Div {
                               H3("Shipping a SaaS backend using Vapor").class("h3")
                               List {
                                ListItem {
                                    H4 {
                                        Link("Petr Pavlik", url: "/speakers/petr-pavlik/")
                                    }.class("f-weight-300")
                                }
                               }.class("speaker-list")
                           }.class("description p-2")
                       }.class("card")

                       Div {
                           Div {
                               Div {
                                   IFrame(url: "https://www.youtube.com/embed/4iB8s2fEmYc", addBorder: false, allowFullScreen: true, enabledFeatureNames: ["autoplay", "encrypted-media"])
                               }.class("embed-container")
                           }.class("video")
                           Div {
                               H3("How does Server Side Swift Workout in the Real World?").class("h3")
                               List {
                                ListItem {
                                    H4 {
                                        Link("Leo Dion", url: "/speakers/leo-dion/")
                                    }.class("f-weight-300")
                                }
                               }.class("speaker-list")
                           }.class("description p-2")
                       }.class("card")
                   }.class("list")
                   H4("More videos coming soon...").class("text-center mb-5")

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
