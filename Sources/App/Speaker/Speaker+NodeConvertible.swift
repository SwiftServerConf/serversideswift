import Vapor

extension Speaker: NodeConvertible {
    init(node: Node) throws {
        try self.init(
            name: node.get("name"),
            title: node.get("title"),
            company: node.get("company"),
            twitter: node.get("twitter"),
            github: node.get("github")
        )
    }

    func makeNode(in context: Context?) throws -> Node {
        return try Node(node: [
            "name": name,
            "title": title,
            "company": company,
            "twitter": twitter ?? "",
            "github": github ?? ""
            ])
    }
}
