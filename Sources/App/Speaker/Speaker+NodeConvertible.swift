import Vapor

extension Speaker: NodeConvertible {
    init(node: Node) throws {
        try self.init(
            key: node.get("key"),
            imageUrl: node.get("imageUrl"),
            name: node.get("name"),
            title: node.get("title"),
            company: node.get("company"),
            topic: node.get("topic"),
            twitter: node.get("twitter"),
            github: node.get("github")
        )
    }

    func makeNode(in context: Context?) throws -> Node {
        return try Node(node: [
            "key": .string(key.rawValue),
            "imageUrl": .string(imageUrl),
            "name": .string(name),
            "title": .string(title),
            "company": .string(company),
            "topic": .string(topic),
            "twitter": twitter?.makeNode(in: nil) ?? "",
            "github": github?.makeNode(in: nil) ?? "",
            ])
    }
}
