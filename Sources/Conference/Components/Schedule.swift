import Plot

struct Schedule: Component {
    var body: Component {
        ComponentGroup {
            Div {
                Div {
                    Div {
                        H1("Schedule").class("text-center text-white")
                        H4("Two days packed with inspiring content.").class("text-center mb-5")
                       Div {
                           Div {
                               Div {
                                   H3("Thursday, September 26th - Conference Day 1").class("h3")
                                   Div {
                                       let headerRow = TableRow {
                                           TableHeaderCell("When").attribute(named: "scope", value: "col").class("time-column")
                                           TableHeaderCell("What").attribute(named: "scope", value: "col")
                                       }
                                       Table(header: headerRow) {
                                           TableRow {
                                               TableCell("08:30 - 09:15").class("text-center font-weight-bold")
                                               TableCell("Breakfast and Registration")
                                           }
                                           TableRow {
                                               TableCell("09:15 - 09:20").class("text-center font-weight-bold")
                                               TableCell("Welcome")
                                           }
                                           TableRow {
                                               TableCell("09:20 - 10:00").class("text-center font-weight-bold")
                                               TableCell("Keynote")
                                           }
                                           TableRow {
                                               TableCell("10:00 - 10:40").class("text-center font-weight-bold")
                                               createTalkRow(speaker: AllSpeakers.speakers[0])
                                           }
                                           TableRow {
                                               TableCell("10:40 - 11:30").class("text-center font-weight-bold")
                                               Text("Coffee Break")
                                           }
                                           TableRow {
                                               TableCell("11:30 - 12:10").class("text-center font-weight-bold")
                                               createTalkRow(speaker: AllSpeakers.speakers[4])
                                           }
                                           TableRow {
                                               TableCell("12:10 - 12:45").class("text-center font-weight-bold")
                                               Text("To Be Announced")
                                           }
                                           TableRow {
                                               TableCell("12:45 - 14:00").class("text-center font-weight-bold")
                                               TableCell("Lunch")
                                           }
                                           TableRow {
                                               TableCell("14:00 - 14:40").class("text-center font-weight-bold")
                                               createTalkRow(speaker: AllSpeakers.speakers[7])
                                           }
                                           TableRow {
                                               TableCell("14:40 - 15:15").class("text-center font-weight-bold")
                                               createTalkRow(speaker: AllSpeakers.speakers[9])
                                           }
                                           TableRow {
                                               TableCell("15:15 - 16:00").class("text-center font-weight-bold")
                                               TableCell("Coffee Break")
                                           }     
                                           TableRow {
                                               TableCell("16:00 - 16:40").class("text-center font-weight-bold")
                                               createTalkRow(speaker: AllSpeakers.speakers[10])
                                           }
                                           TableRow {
                                               TableCell("16:40 - 17:15").class("text-center font-weight-bold")
                                               Text("To Be Announced")
                                           }
                                           TableRow {
                                               TableCell("18:00 - 21:00").class("text-center font-weight-bold")
                                               TableCell("Social Event TBD")
                                           }
                                       }.class("table table-striped table-bordered")
                                   }.class("panel")
                               }.class("mb-5")
                               Div {
                                   H3("Thursday, September 26th - Conference Day 2").class("h3")
                                   Div {
                                       let headerRow = TableRow {
                                           TableHeaderCell("When").attribute(named: "scope", value: "col").class("time-column")
                                           TableHeaderCell("What").attribute(named: "scope", value: "col")
                                       }
                                       Table(header: headerRow) {
                                           TableRow {
                                               TableCell("08:30 - 09:30").class("text-center font-weight-bold")
                                               TableCell("Breakfast")
                                           }
                                           TableRow {
                                               TableCell("09:30 - 10:10").class("text-center font-weight-bold")
                                               createTalkRow(speaker: AllSpeakers.speakers[5])
                                           }
                                           TableRow {
                                               TableCell("10:10 - 10:50").class("text-center font-weight-bold")
                                               createTalkRow(speaker: AllSpeakers.speakers[6])
                                           }
                                           TableRow {
                                               TableCell("10:50 - 11:30").class("text-center font-weight-bold")
                                               Text("Coffee Break")
                                           }
                                           TableRow {
                                               TableCell("11:30 - 12:10").class("text-center font-weight-bold")
                                               createTalkRow(speaker: AllSpeakers.speakers[1])
                                           }
                                           TableRow {
                                               TableCell("12:10 - 12:45").class("text-center font-weight-bold")
                                               createTalkRow(speaker: AllSpeakers.speakers[3])
                                           }
                                           TableRow {
                                               TableCell("12:45 - 14:00").class("text-center font-weight-bold")
                                               TableCell("Lunch")
                                           }
                                           TableRow {
                                               TableCell("14:00 - 14:15").class("text-center font-weight-bold")
                                            //    createTalkRow(speaker: AllSpeakers.lightningSpeakers[0])
                                               Text("To Be Announced")
                                           }
                                           TableRow {
                                               TableCell("14:15 - 14:30").class("text-center font-weight-bold")
                                            //    createTalkRow(speaker: AllSpeakers.lightningSpeakers[1])
                                               Text("To Be Announced")
                                           }
                                           TableRow {
                                               TableCell("14:30 - 14:45").class("text-center font-weight-bold")
                                            //    createTalkRow(speaker: AllSpeakers.lightningSpeakers[2])
                                                Text("To Be Announced")
                                           }
                                           TableRow {
                                               TableCell("14:45 - 15:00").class("text-center font-weight-bold")
                                            //    createTalkRow(speaker: AllSpeakers.lightningSpeakers[3])
                                               Text("To Be Announced")
                                           }
                                           TableRow {
                                               TableCell("15:00 - 15:50").class("text-center font-weight-bold")
                                               TableCell("Coffee Break")
                                           }     
                                           TableRow {
                                               TableCell("15:50 - 16:30").class("text-center font-weight-bold")
                                               createTalkRow(speaker: AllSpeakers.speakers[8])
                                           }
                                           TableRow {
                                               TableCell("16:30 - 17:10").class("text-center font-weight-bold")
                                               createTalkRow(speaker: AllSpeakers.speakers[2])
                                           }
                                           TableRow {
                                               TableCell("17:10 - 17:15").class("text-center font-weight-bold")
                                               TableCell("Closing Remarks")
                                           }
                                           TableRow {
                                               TableCell("18:00 - 21:00").class("text-center font-weight-bold")
                                               TableCell("After Party TBD")
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
