import AdminPanel
import Sugar
import Vapor

func commands(config: inout CommandConfig) {
    config.useFluentCommands()
    config.use(AdminPanelProvider<AdminPanelUser>.commands(databaseIdentifier: .mysql))
    config.use(Seed2018Command(), as: "seed-2018")
    config.use(Seed2019Command(), as: "seed-2019")
}
