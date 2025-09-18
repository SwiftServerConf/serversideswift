import Plot

struct Schedule: Component {
    var body: Component {
        ComponentGroup {
            Div {
                Div {
                    Div {
                        H1("Schedule").class("text-center text-white")
                        H4("One amazing workshop day and two days packed with inspiring content.").class("text-center mb-5")
                        // H3("Schedule will be revealed once the CFP is closed.").class("text-center mb-5")
                       Div {
                           Div {
                                Div {
                                    H3("Wednesday, October 1st - Workshop Day").class("h3")
                                    Div {
                                        let headerRow = TableRow {
                                            TableHeaderCell("When").attribute(named: "scope", value: "col").class("time-column")
                                            TableHeaderCell("Beginnner Workshop Track").attribute(named: "scope", value: "col")
                                            TableHeaderCell("Experienced Workshop Track").attribute(named: "scope", value: "col")
                                        }
                                        Table(header: headerRow) {
                                            TableRow {
                                                TableCell("09:00 - 09:30").class("text-center font-weight-bold")
                                                TableCell("Breakfast and Registration").attribute(named: "colspan", value: "2")
                                            }
                                            TableRow {
                                                TableCell("9:30 - 12:30").class("text-center font-weight-bold")
                                                createWorkshopRow(speakers: [AllSpeakers.instructors[0], AllSpeakers.instructors[3]])
                                                createWorkshopRow(speakerName: "Matt Massicotte")
                                            }
                                            TableRow {
                                                TableCell("12:30 - 14:00").class("text-center font-weight-bold")
                                                TableCell("Lunch").attribute(named: "colspan", value: "2")
                                            }
                                            TableRow {
                                                TableCell("14:00 - 17:00").class("text-center font-weight-bold")
                                                createWorkshopRow(speakerName: "Agam Dua")
                                                createWorkshopRow(speakerName: "Frank Lefebvre")
                                            }
                                        }.class("table table-striped table-bordered")
                                    }.class("panel")
                                }.class("mb-5")
                               Div {
                                   H3("Thursday, October 2nd - Conference Day 1").class("h3")
                                   Div {
                                       let headerRow = TableRow {
                                           TableHeaderCell("When").attribute(named: "scope", value: "col").class("time-column")
                                           TableHeaderCell("What").attribute(named: "scope", value: "col")
                                       }
                                       Table(header: headerRow) {
                                           TableRow {
                                               TableCell("09:00 - 09:45").class("text-center font-weight-bold")
                                               TableCell("Breakfast and Registration")
                                           }
                                           TableRow {
                                               TableCell("09:45 - 09:50").class("text-center font-weight-bold")
                                               TableCell("Welcome")
                                           }
                                           TableRow {
                                               TableCell("09:50 - 10:40").class("text-center font-weight-bold")
                                                createTalkRow(speakerName: "Ben Cohen")
                                           }
                                           TableRow {
                                               TableCell("10:40 - 11:30").class("text-center font-weight-bold")
                                               Text("Coffee Break")
                                           }
                                           TableRow {
                                               TableCell("11:30 - 12:10").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Matt Massicotte")
                                           }
                                           TableRow {
                                               TableCell("12:10 - 12:45").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Adam Fowler")
                                           }
                                           TableRow {
                                               TableCell("12:45 - 14:00").class("text-center font-weight-bold")
                                               TableCell("Lunch")
                                           }
                                           TableRow {
                                               TableCell("14:00 - 14:40").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Emma GAUBERT")
                                           }
                                           TableRow {
                                               TableCell("14:40 - 15:15").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Joannis Orlandos")
                                           }
                                           TableRow {
                                               TableCell("15:15 - 16:00").class("text-center font-weight-bold")
                                               TableCell("Coffee Break")
                                           }     
                                           TableRow {
                                               TableCell("16:00 - 16:40").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Georg Tuparev")
                                           }
                                           TableRow {
                                               TableCell("16:40 - 17:15").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Daniel Jilg")
                                           }
                                           TableRow {
                                               TableCell("19:00 - 21:00").class("text-center font-weight-bold")
                                               TableCell {
                                                    H6("NSLondon x ServerSide.swift Social").class("speakers-list-speaker-name")
                                                    Link("Meetup Details", url: "https://www.meetup.com/nslondon/events/308499113/").linkTarget(.blank)
                                               }
                                           }
                                       }.class("table table-striped table-bordered")
                                   }.class("panel")
                               }.class("mb-5")
                               Div {
                                   H3("Friday, October 3rd - Conference Day 2").class("h3")
                                   Div {
                                       let headerRow = TableRow {
                                           TableHeaderCell("When").attribute(named: "scope", value: "col").class("time-column")
                                           TableHeaderCell("What").attribute(named: "scope", value: "col")
                                       }
                                       Table(header: headerRow) {
                                           TableRow {
                                               TableCell("09:00 - 09:30").class("text-center font-weight-bold")
                                               TableCell("Breakfast")
                                           }
                                           TableRow {
                                               TableCell("09:30 - 10:10").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "George Barnett")
                                           }
                                           TableRow {
                                               TableCell("10:10 - 10:45").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Ben Rosen")
                                           }
                                           TableRow {
                                               TableCell("10:45 - 11:30").class("text-center font-weight-bold")
                                               Text("Coffee Break")
                                           }
                                           TableRow {
                                               TableCell("11:30 - 12:10").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Simon Pilkington")
                                           }
                                           TableRow {
                                               TableCell("12:10 - 12:45").class("text-center font-weight-bold")
                                               createTalkRow(speakers: [AllSpeakers.speakers[17], AllSpeakers.speakers[5]])
                                           }
                                           TableRow {
                                               TableCell("12:45 - 14:00").class("text-center font-weight-bold")
                                               TableCell("Lunch")
                                           }
                                           TableRow {
                                               TableCell("14:00 - 14:15").class("text-center font-weight-bold")
                                                createTalkRow(speakerName: "Franz Busch")
                                           }
                                           TableRow {
                                               TableCell("14:15 - 14:30").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Mona Dierickx")
                                           }
                                           TableRow {
                                               TableCell("14:30 - 14:45").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Oliver Binns")
                                           }
                                           TableRow {
                                               TableCell("14:45 - 15:00").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Honza Dvorsky")
                                           }
                                           TableRow {
                                               TableCell("15:00 - 15:45").class("text-center font-weight-bold")
                                               TableCell("Coffee Break")
                                           }     
                                           TableRow {
                                               TableCell("15:45 - 16:00").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Mads Odgaard")
                                           }
                                           TableRow {
                                               TableCell("16:00 - 16:15").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Mikaela Caron")
                                           }
                                           TableRow {
                                               TableCell("16:15 - 16:30").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Eric Bariaux")
                                           }
                                           TableRow {
                                               TableCell("16:30 - 17:10").class("text-center font-weight-bold")
                                               createTalkRow(speakerName: "Eric Ernst")
                                           }
                                           TableRow {
                                               TableCell("17:10 - 17:15").class("text-center font-weight-bold")
                                               TableCell("Closing Remarks")
                                           }
                                           TableRow {
                                               TableCell("18:30 - 21:00").class("text-center font-weight-bold")
                                               TableCell {
                                                    H6("After Party").class("speakers-list-speaker-name")
                                                    Link("Hoop and Toy", url: "https://www.greeneking.co.uk/pubs/greater-london/hoop-and-toy").linkTarget(.blank)
                                              }
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

    func createTalkRow(speakerName: String) -> TableCell {
        if let speaker = AllSpeakers.speakers.first(where: { $0.name == speakerName }) {
            return createTalkRow(speaker: speaker)
        } else {
            return TableCell {
                Div {
                    Text("Talk TBA")
                }
            }
        }
    }

    func createWorkshopRow(speakerName: String) -> TableCell {
        if let speaker = AllSpeakers.instructors.first(where: { $0.name == speakerName }) {
            return createWorkshopRow(speakers: [speaker])
        } else {
            return TableCell {
                Div {
                    Text("Workshop TBA")
                }
            }
        }
    }

    func createWorkshopRow(speakers: [Speaker]) -> TableCell {
        TableCell {
            Div {
                Div {
                    for speaker in speakers {
                        Span {
                            Link(url: "/speakers/\(speaker.url)") {
                                Image(url: speaker.image, description: speaker.name)
                            }
                        }.class("avatar")
                    }
                }.class("avatars")
                Div {
                    List {
                        for speaker in speakers {
                            ListItem {
                                Link(speaker.name, url: "/speakers/\(speaker.url)").class("speakers-list-speaker-name")
                            }
                        }
                    }.class("speaker-list")
                    Node.br()
                    if let talk = speakers.first?.talks.first(where: { $0.isWorkshop }) {
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

    func createTalkRow(speakers: [Speaker]) -> TableCell {
        TableCell {
            Div {
                Div {
                    for speaker in speakers {
                        Span {
                            Link(url: "/speakers/\(speaker.url)") {
                                Image(url: speaker.image, description: speaker.name)
                            }
                        }.class("avatar")
                    }
                }.class("avatars")
                Div {
                    List {
                        for speaker in speakers {
                            ListItem {
                                Link(speaker.name, url: "/speakers/\(speaker.url)").class("speakers-list-speaker-name")
                            }
                        }
                    }.class("speaker-list")
                    Node.br()
                    if let talk = speakers.first?.talks.first(where: { !$0.isWorkshop }) {
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
    
    func createTalkRow(speaker: Speaker) -> TableCell {
        createTalkRow(speakers: [speaker])
    }
}
