import Plot
import Publish
import Foundation

struct SpeakerList<Site: Website>: Component {
    var speakers: [Speaker]
    
    var body: Component {
        List(speakers) { speaker in
            ListItem(SpeakerOverview(speaker: speaker).body)
                .style("display:inline-block")
        }.class("list p-0")
    }
}

struct SpeakerOverview: Component {
    let speaker: Speaker
    
    var body: Component {
        Div {
            Link(url: speaker.url) {
                Div {
                    Image(url: speaker.image, description: speaker.name)
                }
                .class("image")
                Div {
                    H3(speaker.name)
                        .class("h3")
                    H4(speaker.role)
                        .class("f-weight-300 mb-0")
                    H4(speaker.company)
                        .class("f-weight-300")
                        .style("font-style: italic")
                }
                .class("description p-2")
            }
            .style("text-decoration: none; color:black")
        }
        .class("card")
    }
}

