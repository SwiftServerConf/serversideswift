import Plot

/// Component used to render an `<script>` element for embetdding scripts.
struct Script: Component {
    /// The URL of the script.
    var url: URLRepresentable

    /// Create a new script instance.
    /// - parameters:
    ///   - url: The URL of the script to include.
    init(url: URLRepresentable) {
        self.url = url
    }
    
    var body: Component {
        Node<HTML.BodyContext>.script(.src(url))
    }
}
