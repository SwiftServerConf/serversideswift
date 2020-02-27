import AdminPanel
import Bugsnag
import FluentMySQL
import Leaf
import Mailgun
import Reset
import Sugar
import Vapor

func setUpProviders(
    services: inout Services,
    config: inout Config,
    environment: Environment
) throws {
    // MARK: Vapor

    try services.register(FluentMySQLProvider())
    try services.register(LeafProvider())

    // Admin Panel

    let adminPanelProvider = AdminPanelProvider<AdminPanelUser> { _ in .current(environment) }
    try services.register(adminPanelProvider)

    // MARK: Mailgun

    services.register(
        Mailgun(
            apiKey: env(EnvironmentKey.Mailgun.apiKey, ""),
            domain: env(EnvironmentKey.Mailgun.domain, ""),
            region: .eu
        ),
        as: Mailgun.self
    )

    // MARK: Misc

    try services.register(BugsnagProvider(config: .current(environment)))
}
