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
            bio: node.get("bio"),
            twitter: node.get("twitter"),
            github: node.get("github"),
            youtubeTalkId: node.get("youtubeTalkId")
        )
    }

    func makeNode(in context: Context?) throws -> Node {
        var node = Node([:])
        try node.set("key", key.rawValue)
        try node.set("imageUrl", imageUrl)
        try node.set("name", name)
        try node.set("title", title)
        try node.set("company", company)
        try node.set("topic", topic)
        try node.set("bio", bio)
        try node.set("twitter", twitter)
        try node.set("github", github)
        try node.set("youtubeTalkId", youtubeTalkId)
        return node
    }
}
