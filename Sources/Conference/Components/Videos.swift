import Plot

struct Videos: Component {
    var body: Component {
        Div {
            Div {
                Div {
                    H1("Conference Videos").class("text-center text-white mb-4")
                    H4("Videos will be uploaded after the conference").class("text-center")
                    H4 {
                        Text("To see videos from previous editions ")
                        Link("choose a year", url: "/years")
                        Text(".")
                    }.class("text-center mt-4")
                    
                    /** Current yearr videos **/
//                    H1("Videos").class("text-center text-white mb-4")
//                    H4("Watch all the amazing content from the conference.").class("text-center mb-5")
//                    List {
//                        Div {
//                            Div {
//                                Div {
//                                    IFrame(url: "https://www.youtube.com/embed/eHgpKdvXino", addBorder: false, allowFullScreen: true, enabledFeatureNames: ["autoplay", "encrypted-media"])
//                                }.class("embed-container")
//                            }.class("video")
//                            Div {
//                                H3("Panel Discussion").class("h3")
//                            }.class("description p-2")
//                        }.class("card")
//                    }
//                    H4("More videos coming soon...").class("text-center mb-5")
                }.class("container")
            }.class("page-block no-height bg-blue text-white")
        }.class("videos")
    }
}
