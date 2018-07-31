class Twitter: SocialMedia {}
class Github: SocialMedia {}

protocol UrlAndName {
    var url: String { get }
    var name: String { get }
}

class SocialMedia: UrlAndName, NodeConvertible {
    var url: String
    var name: String

    init(url: String, name: String) {
        self.url = url
        self.name = name
    }

    func makeNode(in context: Context?) throws -> Node {
        return try Node(node: ["url": url, "name": name])
    }

    convenience required init(node: Node) throws {
        try self.init(
            url: node.get("url"),
            name: node.get("name")
        )
    }
}
