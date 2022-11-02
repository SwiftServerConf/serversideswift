import Plot

struct Schedule: Component {
    var body: Component {
        ComponentGroup {
            Div {
                Div {
                    Div {
                        H1("Schedule").class("text-center text-white")
                        H4("A day packed with inspiring content.").class("text-center mb-5")
                        Div {
                            Div {
                                Div {
                                    H3("Friday, December 9th - Conference Day").class("h3")
                                    Div {
                                        let headerRow = TableRow {
                                            TableHeaderCell("When").attribute(named: "scope", value: "col").class("time-column")
                                            TableHeaderCell("What").attribute(named: "scope", value: "col")
                                        }
                                        Table(header: headerRow) {
                                            TableRow {
                                                TableCell("08:30 - 09:00").class("text-center font-weight-bold")
                                                TableCell("Breakfast and Registration")
                                            }
                                            TableRow {
                                                TableCell("09:00 - 09:10").class("text-center font-weight-bold")
                                                TableCell("Welcome")
                                            }
                                            TableRow {
                                                TableCell("09:10 - 09:50").class("text-center font-weight-bold")
                                                TableCell("Talk 1 TBC")
                                            }
                                            TableRow {
                                                TableCell("09:50 - 10:30").class("text-center font-weight-bold")
                                                TableCell("Talk 2 TBC")
                                            }
                                            TableRow {
                                                TableCell("10:30 - 11:00").class("text-center font-weight-bold")
                                                TableCell("Talk 3 TBC")
                                            }
                                            TableRow {
                                                TableCell("11:00 - 11:30").class("text-center font-weight-bold")
                                                TableCell("Coffee Break")
                                            }
                                            TableRow {
                                                TableCell("11:30 - 12:10").class("text-center font-weight-bold")
                                                TableCell("Talk 4 TBC")
                                            }
                                            TableRow {
                                                TableCell("12:10 - 12:45").class("text-center font-weight-bold")
                                                TableCell("Talk 5 TBC")
                                            }
                                            TableRow {
                                                TableCell("12:45 - 13:45").class("text-center font-weight-bold")
                                                TableCell("Lunch")
                                            }
                                            TableRow {
                                                TableCell("13:45 - 13:55").class("text-center font-weight-bold")
                                                TableCell("Lightning Talk 1")
                                            }
                                            TableRow {
                                                TableCell("13:55 - 14:05").class("text-center font-weight-bold")
                                                TableCell("Lightning Talk 2")
                                            }
                                            TableRow {
                                                TableCell("14:05 - 14:15").class("text-center font-weight-bold")
                                                TableCell("Lightning Talk 3")
                                            }
                                            TableRow {
                                                TableCell("14:15 - 15:00").class("text-center font-weight-bold")
                                                TableCell("Talk 6 TBC")
                                            }
                                            TableRow {
                                                TableCell("15:00 - 15:30").class("text-center font-weight-bold")
                                                TableCell("Coffee Break")
                                            }
                                            TableRow {
                                                TableCell("15:30 - 15:40").class("text-center font-weight-bold")
                                                TableCell("Lightning Talk 4")
                                            }
                                            TableRow {
                                                TableCell("15:40 - 15:50").class("text-center font-weight-bold")
                                                TableCell("Lightning Talk 5")
                                            }
                                            TableRow {
                                                TableCell("15:50 - 16:00").class("text-center font-weight-bold")
                                                TableCell("Lightning Talk 6")
                                            }
                                            TableRow {
                                                TableCell("16:00 - 16:40").class("text-center font-weight-bold")
                                                TableCell("Talk 7 TBC")
                                            }
                                            TableRow {
                                                TableCell("16:40 - 17:20").class("text-center font-weight-bold")
                                                TableCell {
                                                    Div {
                                                        Div {
                                                            Span {
                                                                Image(url: "/App/images/speakers/johannes-weiss.jpg", description: "Johannes Weiss")
                                                            }.class("avatar")
                                                        }.class("avatars")
                                                        Div {
                                                            List {
                                                                ListItem {
                                                                    Text("Johannes Weiss")
                                                                }
                                                            }.class("speaker-list")
                                                            Node.br()
                                                            Node.a(
                                                                .attribute(named: "href"),
                                                                .attribute(named: "data-toggle", value: "modal"),
                                                                .attribute(named: "data-target", value: "#global-modal"),
                                                                .attribute(named: "data-description", value: "This talk will cover the pros, cons and gotchas of using existing codebases as a springboard for developing a new web service. We will discuss how you can take mature, battle-tested code from a macOS app and use it as the basis for a web service using the popular server-side Swift framework, Vapor."),
                                                                .component(Text("Swift At Scale")))
                                                        }.class("talk-info")
                                                    }.class("talk")
                                                }
                                            }
                                            TableRow {
                                                TableCell("17:20 - 17:30").class("text-center font-weight-bold")
                                                TableCell("Closing Remarks")
                                            }
                                        }.class("table table-striped table-bordered")
                                    }.class("panel")
                                }.class("mb-5")
                            }.class("col-sm-12")
                        }.class("row")
                    }.class("container")
                }.class("page-block no-height bg-blue text-white")
            }.class("schedule")
            
            Div {
                Div {
                    Div {
                        Div {
                            H5("Title Placeholder").class("modal-title").id("exampleModalLabel")
                            Button {
                                Span {
                                    Text("&times;")
                                }.attribute(named: "aria-hidden", value: "true")
                            }.class("close").attribute(named: "type", value: "button").attribute(named: "data-dismiss", value: "modal").attribute(named: "aria-label", value: "Close")
                        }.class("modal-header")
                        Div {
                            Text("Description Placeholder")
                        }.class("modal-body")
                        Div {
                            Button {
                                Text("Close")
                            }.class("btn btn-default").attribute(named: "type", value: "button").attribute(named: "data-dismiss", value: "modal")
                        }.class("modal-footer")
                    }.class("modal-content")
                }.class("modal-dialog modal-lg modal-dialog-centered").attribute(named: "role", value: "document")
            }.class("modal fade").id("global-modal").attribute(named: "tabindex", value: "-1").attribute(named: "role", value: "dialog").attribute(named: "aria-labelledby", value: "global-modal").attribute(named: "aria-hidden", value: "true")
        }
    }
}
