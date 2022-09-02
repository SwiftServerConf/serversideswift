import Plot

struct SiteScripts: Component {
    let scripts: [Script] = [
        Script(url: "https://code.jquery.com/jquery-3.3.1.slim.min.js", integrity: "sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo", crossOrigin: .anonymous),
        Script(url: "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js", integrity: "sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM", crossOrigin: .anonymous),
//        Script(url: "https://js.tito.io/v1", async: true),
        Script(url: "https://js.tito.io/v2/with/inline", async: true),
        Script(url: "https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"),
        Script(url: "/App/YearX/javascript/particles.js"),
        Script(url: "/App/YearX/javascript/hambuger-menu.js"),
        Script(url: "/App/YearX/javascript/modals.js"),
        Script(url: "https://cdn.apple-mapkit.com/mk/5.x.x/mapkit.js"),
        
    ]

    var body: Component {
        Element(name: "scripts") {
            for item in scripts {
                item
            }
        }
    }
}
