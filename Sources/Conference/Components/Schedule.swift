import Plot

struct Schedule: Component {
    var body: Component {
        ComponentGroup {
            Div {
                Div {
                    Div {
                        H1("Schedule").class("text-center text-white")
                        H4("Two days packed with inspiring content.").class("text-center mb-5")
                        H3("Coming Soon").class("h3 text-center")
//                        Div {
//                            Div {
//                                Div {
//                                    H3("Thursday, December 8th - Social").class("h3")
//                                    Div {
//                                        let headerRow = TableRow {
//                                            TableHeaderCell("When").attribute(named: "scope", value: "col").class("time-column")
//                                            TableHeaderCell("What").attribute(named: "scope", value: "col")
//                                        }
//                                        Table(header: headerRow) {
//                                            TableRow {
//                                                TableCell("19:00 - 22:00").class("text-center font-weight-bold")
//                                                TableCell {
//                                                    Link("NSLondon × ServerSide.swift Social", url: "https://www.meetup.com/nslondon/events/289491932/").linkTarget(.blank)
//                                                }
//                                            }
//                                            
//                                        }.class("table table-striped table-bordered")
//                                    }.class("panel mb-5")
//                                }
//                                Div {
//                                    H3("Friday, December 9th - Conference Day").class("h3")
//                                    Div {
//                                        let headerRow = TableRow {
//                                            TableHeaderCell("When").attribute(named: "scope", value: "col").class("time-column")
//                                            TableHeaderCell("What").attribute(named: "scope", value: "col")
//                                        }
//                                        Table(header: headerRow) {
//                                            TableRow {
//                                                TableCell("08:30 - 09:00").class("text-center font-weight-bold")
//                                                TableCell("Breakfast and Registration")
//                                            }
//                                            TableRow {
//                                                TableCell("09:00 - 09:10").class("text-center font-weight-bold")
//                                                TableCell("Welcome")
//                                            }
//                                            TableRow {
//                                                TableCell("09:10 - 09:50").class("text-center font-weight-bold")
//                                                createTalkRow(speaker: AllSpeakers.speakers[4])
//                                            }
//                                            TableRow {
//                                                TableCell("09:50 - 10:30").class("text-center font-weight-bold")
//                                                createTalkRow(speaker: AllSpeakers.speakers[6])
//                                            }
//                                            TableRow {
//                                                TableCell("10:30 - 11:00").class("text-center font-weight-bold")
//                                                createTalkRow(speaker: AllSpeakers.speakers[0])
//                                            }
//                                            TableRow {
//                                                TableCell("11:00 - 11:30").class("text-center font-weight-bold")
//                                                Text("Coffee Break")
//                                            }
//                                            TableRow {
//                                                TableCell("11:30 - 12:10").class("text-center font-weight-bold")
//                                                createTalkRow(speaker: AllSpeakers.speakers[1])
//                                            }
//                                            TableRow {
//                                                TableCell("12:10 - 12:45").class("text-center font-weight-bold")
//                                                createTalkRow(speaker: AllSpeakers.speakers[3])
//                                            }
//                                            TableRow {
//                                                TableCell("12:45 - 13:45").class("text-center font-weight-bold")
//                                                TableCell("Lunch")
//                                            }
//                                            TableRow {
//                                                TableCell("13:45 - 13:55").class("text-center font-weight-bold")
//                                                createTalkRow(speaker: AllSpeakers.lightningSpeakers[0])
//                                            }
//                                            TableRow {
//                                                TableCell("13:55 - 14:05").class("text-center font-weight-bold")
//                                                createTalkRow(speaker: AllSpeakers.lightningSpeakers[1])
//                                            }
//                                            TableRow {
//                                                TableCell("14:05 - 14:15").class("text-center font-weight-bold")
//                                                createTalkRow(speaker: AllSpeakers.lightningSpeakers[2])
//                                            }
//                                            TableRow {
//                                                TableCell("14:15 - 14:25").class("text-center font-weight-bold")
//                                                createTalkRow(speaker: AllSpeakers.lightningSpeakers[4])
//                                            }
//                                            TableRow {
//                                                TableCell("14:25 - 14:35").class("text-center font-weight-bold")
//                                                createTalkRow(speaker: AllSpeakers.lightningSpeakers[5])
//                                            }
//                                            TableRow {
//                                                TableCell("14:35 - 14:45").class("text-center font-weight-bold")
//                                                createTalkRow(speaker: AllSpeakers.lightningSpeakers[3])
//                                            }
//                                            TableRow {
//                                                TableCell("14:45 - 15:15").class("text-center font-weight-bold")
//                                                TableCell("Coffee Break")
//                                            }     
//                                            TableRow {
//                                                TableCell("15:15 - 15:55").class("text-center font-weight-bold")
//                                                createTalkRow(speaker: AllSpeakers.speakers[2])
//                                            }
//                                            TableRow {
//                                                TableCell("15:55 - 16:35").class("text-center font-weight-bold")
//                                                createTalkRow(speaker: AllSpeakers.speakers[5])
//                                            }
//                                            TableRow {
//                                                TableCell("16:40 - 17:10").class("text-center font-weight-bold")
//                                                TableCell("Panel")
//                                            }
//                                            TableRow {
//                                                TableCell("17:10 - 17:15").class("text-center font-weight-bold")
//                                                TableCell("Closing Remarks")
//                                            }
//                                            TableRow {
//                                                TableCell("18:00 - 21:00").class("text-center font-weight-bold")
//                                                TableCell("After Party at Hoop & Toy")
//                                            }
//                                        }.class("table table-striped table-bordered")
//                                    }.class("panel")
//                                }.class("mb-5")
//                            }.class("col-sm-12")
//                        }.class("row")
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
    
    func createTalkRow(speaker: Speaker) -> TableCell {
        TableCell {
            Div {
                Div {
                    Span {
                        Image(url: speaker.image, description: speaker.name)
                    }.class("avatar")
                }.class("avatars")
                Div {
                    List {
                        ListItem {
                            Text(speaker.name)
                        }
                    }.class("speaker-list")
                    Node.br()
                    if let talk = speaker.talks.first {
                        Node.a(
                            .attribute(named: "href"),
                            .attribute(named: "data-toggle", value: "modal"),
                            .attribute(named: "data-target", value: "#global-modal"),
                            .attribute(named: "data-title", value: talk.title),
                            .attribute(named: "data-description", value: talk.description.render().replacingOccurrences(of: "\"", with: "&quot;")),
                            .component(Text(talk.title)))
                    }
                }.class("talk-info")
            }.class("talk")
        }
    }
}
