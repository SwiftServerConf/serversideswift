import AdminPanel
import Leaf
import Vapor

func leafTags(config: inout LeafTagConfig) throws {
    config.useAdminPanelLeafTags(AdminPanelUser.self)
    config.useBootstrapLeafTags()
    config.useFlashLeafTags()
    config.useResetLeafTags()
    config.useSubmissionsLeafTags()
}
