import Plot

struct Schedule: Component {
    var body: Component {
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
                                            TableCell("15:30 - 16:10").class("text-center font-weight-bold")
                                            TableCell("Talk 7 TBC")
                                        }
                                        TableRow {
                                            TableCell("16:10 - 16:50").class("text-center font-weight-bold")
                                            TableCell("Talk 8 TBC")
                                        }
                                        TableRow {
                                            TableCell("16:50 - 17:15").class("text-center font-weight-bold")
                                            TableCell("Panel")
                                        }
                                        TableRow {
                                            TableCell("17:15 - 17:20").class("text-center font-weight-bold")
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
    }
}

struct TableHead: Component {
    let cells: [TableHeaderCell]
    
    var body: Component {
        
        Node<HTML.BodyContext>.element(named: "thead", nodes: cells.map {
            $0.body.convertToNode()
        })
    }
}
