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
                        // Div {
                        //     Div {
                        //         Div {
                        //             IFrame(
                        //                 url: "https://www.youtube.com/embed/FuTpnddLhpU",
                        //                 addBorder: false, allowFullScreen: true,
                        //                 enabledFeatureNames: ["autoplay", "encrypted-media"])
                        //         }.class("embed-container")
                        //     }.class("video")
                        //     Div {
                        //         H3("Swift & Interoperability").class("h3")
                        //         List {
                        //             ListItem {
                        //                 H4 {
                        //                     Link("Tony Parker", url: "/speakers/tony-parker/")
                        //                 }.class("f-weight-300")
                        //             }
                        //             ListItem {
                        //                 H4 {
                        //                     Link("Ben Cohen", url: "/speakers/ben-cohen/")
                        //                 }.class("f-weight-300")
                        //             }
                        //         }.class("speaker-list")
                        //     }.class("description p-2")
                        // }.class("card")

                        Div {
                            Div {
                                Div {
                                    IFrame(
                                        url: "https://www.youtube.com/embed/MroBR2ProT0",
                                        addBorder: false, allowFullScreen: true,
                                        enabledFeatureNames: ["autoplay", "encrypted-media"])
                                }.class("embed-container")
                            }.class("video")
                            Div {
                                H3("When to Make a Macro").class("h3")
                                List {
                                    ListItem {
                                        H4 {
                                            Link("Daniel Steinberg", url: "/speakers/daniel-steinberg/")
                                        }.class("f-weight-300")
                                    }
                                }.class("speaker-list")
                            }.class("description p-2")
                        }.class("card")

                        Div {
                            Div {
                                Div {
                                    IFrame(
                                        url: "https://www.youtube.com/embed/FuTpnddLhpU",
                                        addBorder: false, allowFullScreen: true,
                                        enabledFeatureNames: ["autoplay", "encrypted-media"])
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
                                    IFrame(
                                        url: "https://www.youtube.com/embed/QFuZq9PHkTo",
                                        addBorder: false, allowFullScreen: true,
                                        enabledFeatureNames: ["autoplay", "encrypted-media"])
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
                                    IFrame(
                                        url: "https://www.youtube.com/embed/4iB8s2fEmYc",
                                        addBorder: false, allowFullScreen: true,
                                        enabledFeatureNames: ["autoplay", "encrypted-media"])
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

                        Div {
                            Div {
                                Div {
                                    IFrame(
                                        url: "https://www.youtube.com/embed/lHXjs3L2ads",
                                        addBorder: false, allowFullScreen: true,
                                        enabledFeatureNames: ["autoplay", "encrypted-media"])
                                }.class("embed-container")
                            }.class("video")
                            Div {
                                H3("Just Save a File, It's Easy, Right?!").class("h3")
                                List {
                                    ListItem {
                                        H4 {
                                            Link("Mikaela Caron", url: "/speakers/mikaela-caron/")
                                        }.class("f-weight-300")
                                    }
                                }.class("speaker-list")
                            }.class("description p-2")
                        }.class("card")

                        // Div {
                        //     Div {
                        //         Div {
                        //             IFrame(
                        //                 url: "https://www.youtube.com/embed/lHXjs3L2ads",
                        //                 addBorder: false, allowFullScreen: true,
                        //                 enabledFeatureNames: ["autoplay", "encrypted-media"])
                        //         }.class("embed-container")
                        //     }.class("video")
                        //     Div {
                        //         H3("Leveraging structured concurrency in your applications").class("h3")
                        //         List {
                        //             ListItem {
                        //                 H4 {
                        //                     Link("Franz Busch", url: "/speakers/franz-busch/")
                        //                 }.class("f-weight-300")
                        //             }
                        //         }.class("speaker-list")
                        //     }.class("description p-2")
                        // }.class("card")

                        Div {
                            Div {
                                Div {
                                    IFrame(
                                        url: "https://www.youtube.com/embed/M1POAEPATFo",
                                        addBorder: false, allowFullScreen: true,
                                        enabledFeatureNames: ["autoplay", "encrypted-media"])
                                }.class("embed-container")
                            }.class("video")
                            Div {
                                H3("Swift, Server-Side, Serverless").class("h3")
                                List {
                                    ListItem {
                                        H4 {
                                            Link("Sébastien Stormacq", url: "/speakers/sebastien-stormacq/")
                                        }.class("f-weight-300")
                                    }
                                }.class("speaker-list")
                            }.class("description p-2")
                        }.class("card")

                        Div {
                            Div {
                                Div {
                                    IFrame(
                                        url: "https://www.youtube.com/embed/IAN0dmIAoeU",
                                        addBorder: false, allowFullScreen: true,
                                        enabledFeatureNames: ["autoplay", "encrypted-media"])
                                }.class("embed-container")
                            }.class("video")
                            Div {
                                H3("How to kickstart your journey into the backend world").class("h3")
                                List {
                                    ListItem {
                                        H4 {
                                            Link("Thomas Durand", url: "/speakers/thomas-durand/")
                                        }.class("f-weight-300")
                                    }
                                }.class("speaker-list")
                            }.class("description p-2")
                        }.class("card")

                        Div {
                            Div {
                                Div {
                                    IFrame(
                                        url: "https://www.youtube.com/embed/cJyNok8OAuE",
                                        addBorder: false, allowFullScreen: true,
                                        enabledFeatureNames: ["autoplay", "encrypted-media"])
                                }.class("embed-container")
                            }.class("video")
                            Div {
                                H3("Swift for WebAssembly").class("h3")
                                List {
                                    ListItem {
                                        H4 {
                                            Link("Steven Van Impe", url: "/speakers/steven-van-impe/")
                                        }.class("f-weight-300")
                                    }
                                }.class("speaker-list")
                            }.class("description p-2")
                        }.class("card")

                        Div {
                            Div {
                                Div {
                                    IFrame(
                                        url: "https://www.youtube.com/embed/QGO5ZuWM5pY",
                                        addBorder: false, allowFullScreen: true,
                                        enabledFeatureNames: ["autoplay", "encrypted-media"])
                                }.class("embed-container")
                            }.class("video")
                            Div {
                                H3("The Adventures and Misadventures of Building a Trivia app with Vapor").class("h3")
                                List {
                                    ListItem {
                                        H4 {
                                            Link("Adegboyega Olusunmade", url: "/speakers/adegboyega-olusunmade/")
                                        }.class("f-weight-300")
                                    }
                                }.class("speaker-list")
                            }.class("description p-2")
                        }.class("card")

                        // Div {
                        //     Div {
                        //         Div {
                        //             IFrame(
                        //                 url: "https://www.youtube.com/embed/QGO5ZuWM5pY",
                        //                 addBorder: false, allowFullScreen: true,
                        //                 enabledFeatureNames: ["autoplay", "encrypted-media"])
                        //         }.class("embed-container")
                        //     }.class("video")
                        //     Div {
                        //         H3("Swift to the cloud in a single step").class("h3")
                        //         List {
                        //             ListItem {
                        //                 H4 {
                        //                     Link("Euan Harris", url: "/speakers/euan-harris/")
                        //                 }.class("f-weight-300")
                        //             }
                        //         }.class("speaker-list")
                        //     }.class("description p-2")
                        // }.class("card")

                        Div {
                            Div {
                                Div {
                                    IFrame(
                                        url: "https://www.youtube.com/embed/QPVd4iw-CbI",
                                        addBorder: false, allowFullScreen: true,
                                        enabledFeatureNames: ["autoplay", "encrypted-media"])
                                }.class("embed-container")
                            }.class("video")
                            Div {
                                H3("The Success Story of Server-Side Swift at Cultured Code").class("h3")
                                List {
                                    ListItem {
                                        H4 {
                                            Link("Vojtech Rylko", url: "/speakers/vojtech-rylko/")
                                        }.class("f-weight-300")
                                    }
                                }.class("speaker-list")
                            }.class("description p-2")
                        }.class("card")

                        Div {
                            Div {
                                Div {
                                    IFrame(
                                        url: "https://www.youtube.com/embed/n1PRYVveLd0",
                                        addBorder: false, allowFullScreen: true,
                                        enabledFeatureNames: ["autoplay", "encrypted-media"])
                                }.class("embed-container")
                            }.class("video")
                            Div {
                                H3("Stop Worrying About Routes With OpenAPI Generator").class("h3")
                                List {
                                    ListItem {
                                        H4 {
                                            Link("Babeth Velghe", url: "/speakers/babeth-velghe/")
                                        }.class("f-weight-300")
                                    }
                                }.class("speaker-list")
                            }.class("description p-2")
                        }.class("card")

                        Div {
                            Div {
                                Div {
                                    IFrame(
                                        url: "https://www.youtube.com/embed/FHO_BfidQlQ",
                                        addBorder: false, allowFullScreen: true,
                                        enabledFeatureNames: ["autoplay", "encrypted-media"])
                                }.class("embed-container")
                            }.class("video")
                            Div {
                                H3("Introduction to Hummingbird 2").class("h3")
                                List {
                                    ListItem {
                                        H4 {
                                            Link("Joannis Orlandos", url: "/speakers/joannis-orlandos/")
                                        }.class("f-weight-300")
                                    }
                                }.class("speaker-list")
                            }.class("description p-2")
                        }.class("card")

                        Div {
                            Div {
                                Div {
                                    IFrame(
                                        url: "https://www.youtube.com/embed/smkRzwANNQ8",
                                        addBorder: false, allowFullScreen: true,
                                        enabledFeatureNames: ["autoplay", "encrypted-media"])
                                }.class("embed-container")
                            }.class("video")
                            Div {
                                H3("So You Think You Know Swift?").class("h3")
                                List {
                                    ListItem {
                                        H4 {
                                            Link("Nick Lockwood", url: "/speakers/nick-lockwood/")
                                        }.class("f-weight-300")
                                    }
                                }.class("speaker-list")
                            }.class("description p-2")
                        }.class("card")

                        // Div {
                        //     Div {
                        //         Div {
                        //             IFrame(
                        //                 url: "https://www.youtube.com/embed/smkRzwANNQ8",
                        //                 addBorder: false, allowFullScreen: true,
                        //                 enabledFeatureNames: ["autoplay", "encrypted-media"])
                        //         }.class("embed-container")
                        //     }.class("video")
                        //     Div {
                        //         H3("Swift on Server: How it powers Private Cloud Compute").class("h3")
                        //         List {
                        //             ListItem {
                        //                 H4 {
                        //                     Link("Cory Benfield", url: "/speakers/cory-benfield/")
                        //                 }.class("f-weight-300")
                        //             }
                        //         }.class("speaker-list")
                        //     }.class("description p-2")
                        // }.class("card")

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
