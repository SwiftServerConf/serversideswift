import Plot

struct Years: Component {
    var body: Component {
        Div {
            Div {
                Div {
                    H1("Years").class("text-center text-white")
                    H4("Click on a year and time travel to past conferences!").class("text-center mb-5")
                    Div {
                        Div {
                            Link("2024", url: "/").class("btn year current")
                            Span {
                                Span().class("anchor")
                            }.class("line")
                        }.class("year")
                        
                        Div {
                            Link("2022", url: "/2022").class("btn year")
                            Span {
                                Span().class("anchor")
                            }.class("line")
                        }.class("year")
                        Div {
                            Link("2019", url: "/2019").class("btn year")
                            Span {
                                Span().class("anchor")
                            }.class("line")
                        }.class("year")
                        Div {
                            Link("2018", url: "/2018").class("btn year")
                            Span {
                                Span().class("anchor")
                            }.class("line")
                        }.class("year")
                    }.class("year-list")
                }.class("container")
            }.class("page-block no-height bg-blue text-white")
        }.class("years mb-5")
    }
}
