import Plot
import Publish

struct SiteFooter: Component {
    var body: Component {
        Footer {
            Div {
                Div {
                    Link("Years", url: "/years").class("text-white")
                    Span().class("underline")
                }.class("year-switcher")
                Div {
                    Link(url: "https://github.com/SwiftServerConf") {
                        Span {
                            SVG(url: "/App/YearX/images/icons/feather-sprite.svg#github").class("feather text-white")
                        }.class("icon")
                    }.linkTarget(.blank)
                    Link(url: "https://twitter.com/SwiftServerConf") {
                        Span {
                            SVG(url: "/App/YearX/images/icons/feather-sprite.svg#twitter").class("feather text-white")
                        }.class("icon")
                    }.linkTarget(.blank)
                    Link(url: "https://www.instagram.com/swiftserverconf/") {
                        Span {
                            SVG(url: "/App/YearX/images/icons/feather-sprite.svg#instagram").class("feather text-white")
                        }.class("icon")
                    }.linkTarget(.blank)
                    Link(url: "https://www.facebook.com/SwiftServerConf") {
                        Span {
                            SVG(url: "/App/YearX/images/icons/feather-sprite.svg#facebook").class("feather text-white")
                        }.class("icon")
                    }.linkTarget(.blank)
                }.class("social-media")
            }.class("container d-flex justify-content-spacearound")
        }.class("navbar footer")
    }
}
