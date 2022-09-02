//
//  File.swift
//  
//
//  Created by Tim Condon on 02/09/2022.
//

import Plot

struct FAQ: Component {
    var body: Component {
        Div {
            Div {
                H1("FAQ").class("text-center text-white")
                H4("Answers to the most commonly asked questions.").class("text-center mb-5")
                Div {
                    Div {
                        H3("Will all the content be in English?").class("h3")
                        Paragraph("Yes. All workshops, talks and material will be in English.")
                    }.class("col-xs-12 mb-4")
                }.class("row")
                
                Div {
                    Div {
                        H3("What is the difference between an Early Bird ticket and a non Early Bird ticket?").class("h3")
                        Paragraph("Nothing besides the price. We offer a small discount for early birds who buy a ticket first. Please be aware that the number of Early Bird tickets is very limited.")
                    }.class("col-xs-12 mb-4")
                }.class("row")
                
                Div {
                    Div {
                        H3("What is included in the price?").class("h3")
                        Paragraph("A conference ticket includes: talks from experts in the field, daily lunch, snacks, coffee breaks and goodie bags with some conference/tech swag. Please note that accommodation is not included in the price.")
                    }.class("col-xs-12 mb-4")
                }.class("row")
                
                Div {
                    Div {
                        H3("Can you recommend a hotel?").class("h3")
                        Paragraph("We'll be addind some more information about the location in the next week or so.")
                    }.class("col-xs-12 mb-4")
                }.class("row")
                
                Div {
                    Div {
                        H3("Can I refund my ticket or sell it to somebody else?").class("h3")
                        Paragraph("Tickets are non-refundable, but you are able to re-assign your ticket to somebody else using the link you received when buying your ticket.")
                    }.class("col-xs-12 mb-4")
                }.class("row")
                
                Div {
                    Div {
                        H3("How do I apply for a diversity ticket?").class("h3")
                        Paragraph {
                            Text("If you come from an under-represented or less privileged group and would like to apply for a diversity ticket, please send us an ")
                            Link("email", url: "mailto:info@serversideswift.info")
                            Text(" with a few words about yourself and why you want to participate in the conference.")
                        }
                    }.class("col-xs-12 mb-4")
                }.class("row")
                
                Div {
                    Div {
                        H3("Do you have a Code of Conduct?").class("h3")
                        Paragraph {
                            Text("Yes we do! Our Code of Conduct can be found ")
                            Link("here", url: "/coc")
                            Text(".")
                        }
                    }.class("col-xs-12 mb-4")
                }.class("row")
                
                Div {
                    Div {
                        H3("My question didn't get answered, what do I do?").class("h3")
                        Paragraph {
                            Text("Feel free to ")
                            Link("tweet us", url: "https://twitter.com/SwiftServerConf")
                            Text(" or send us an ")
                            Link("email", url: "mailto:info@serversideswift.info")
                            Text(".")
                        }
                    }.class("col-xs-12 mb-4")
                }.class("row")
            }.class("container")
        }.class("page-block no-height bg-blue text-white")
    }
}
