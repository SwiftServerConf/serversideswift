import Plot

struct SVG: Component {
    let url: URLRepresentable
    
    var body: Component {
        Node<HTML.BodyContext>.element(named: "svg", nodes: [
            Node.selfClosedElement(named: "use", attributes: [
                Attribute<HTML.BodyContext>(name: "xlink:href", value: url.description)
            ])
        ])
    }
}
