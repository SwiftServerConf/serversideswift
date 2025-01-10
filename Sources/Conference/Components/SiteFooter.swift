import Plot
import Publish

struct SiteFooter: Component {
    var body: Component {
        Footer {
            Div {
                Div {
                    Link("Years", url: "/years").class("text-white")
                    Span().class("underline")
                }.class("year-switcher py-3 py-md-0 mx-auto mx-md-0")
                Div {
                    Link(url: "https://github.com/SwiftServerConf") {
                        Span {
                            SVG(url: "/App/YearX/images/icons/feather-sprite.svg#github").class("feather text-white")
                        }.class("icon")
                    }.attribute(named: "rel", value: "me").linkTarget(.blank)
                    Link(url: "https://hachyderm.io/@swiftserverconf") {
                        Span {
                            Image(url: "/App/YearX/images/icons/mastodon.svg", description: "Mastodon")
                                                .class("feather-replacement")
                        }.class("icon")
                    }.attribute(named: "rel", value: "me").linkTarget(.blank)
                    Link(url: "https://bsky.app/profile/serversideswift.info") {
                        Span {
                            Image(url: "/App/YearX/images/icons/bluesky.svg", description: "Bluesky")
                                                .class("feather-replacement")
                        }.class("icon")
                    }.attribute(named: "rel", value: "me").linkTarget(.blank)
                    Link(url: "https://www.threads.net/@swiftserverconf") {
                        Span {
                            Image(url: "/App/YearX/images/icons/threads.svg", description: "Threads")
                                                .class("feather-replacement")
                        }.class("icon")
                    }.attribute(named: "rel", value: "me").linkTarget(.blank)
                    Link(url: "https://www.linkedin.com/company/swiftserverconf") {
                        Span {
                            SVG(url: "/App/YearX/images/icons/feather-sprite.svg#linkedin").class("feather text-white")
                        }.class("icon")
                    }.attribute(named: "rel", value: "me").linkTarget(.blank)
                    Link(url: "https://www.youtube.com/@SwiftServerConf") {
                        Span {
                            SVG(url: "/App/YearX/images/icons/feather-sprite.svg#youtube").class("feather text-white")
                        }.class("icon")
                    }.attribute(named: "rel", value: "me").linkTarget(.blank)
                    Link(url: "https://twitter.com/SwiftServerConf") {
                        Span {
                            SVG(url: "/App/YearX/images/icons/feather-sprite.svg#twitter").class("feather text-white")
                        }.class("icon")
                    }.attribute(named: "rel", value: "me").linkTarget(.blank)
                    Link(url: "https://www.instagram.com/swiftserverconf/") {
                        Span {
                            SVG(url: "/App/YearX/images/icons/feather-sprite.svg#instagram").class("feather text-white")
                        }.class("icon")
                    }.attribute(named: "rel", value: "me").linkTarget(.blank)
                    Link(url: "https://www.facebook.com/SwiftServerConf") {
                        Span {
                            SVG(url: "/App/YearX/images/icons/feather-sprite.svg#facebook").class("feather text-white")
                        }.class("icon")
                    }.attribute(named: "rel", value: "me").linkTarget(.blank)
                }.class("social-media d-flex flex-wrap justify-content-center")
            }.class("container d-flex justify-content-spacearound")
        }.class("navbar footer")
    }
}
