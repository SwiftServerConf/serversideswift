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
                }.class("container")
            }.class("page-block no-height bg-blue text-white")
        }.class("videos")
    }
}
