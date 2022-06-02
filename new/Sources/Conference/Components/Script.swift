import Plot

/// Component used to render an `<script>` element for embetdding scripts.
struct Script: Component {
    /// The URL of the script.
    let url: URLRepresentable
    let async: Bool
    let integrity: String?
    let crossOrigin: CrossOrigin?
    
    enum CrossOrigin {
        case anonymous
    }

    /// Create a new script instance.
    /// - parameters:
    ///   - url: The URL of the script to include.
    init(url: URLRepresentable, async: Bool = false, integrity: String? = nil, crossOrigin: CrossOrigin? = nil) {
        self.url = url
        self.async = async
        self.integrity = integrity
        self.crossOrigin = crossOrigin
    }
    
    var body: Component {
        Node<HTML.BodyContext>.script(.src(url))
    }
}
