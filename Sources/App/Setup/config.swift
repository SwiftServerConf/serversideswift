import AdminPanel
import Bugsnag
import FluentMySQL
import Leaf
import NMeta
import Paginator
import Redis
import Reset
import Sugar
import Vapor

extension AdminPanelConfig where U == AdminPanelUser {
    static func current(_ environment: Environment) -> AdminPanelConfig<AdminPanelUser> {
        return AdminPanelConfig(
            name: ProjectConfig.current.name,
            baseURL: ProjectConfig.current.url,
            views: AdminPanelViews(
                dashboard: AdminPanelViews.Dashboard(index: ViewPath.AdminPanel.Dashboard.index)
            ),
            sidebarMenuPathGenerator: { role in
                guard let role = role else { return "" }
                switch role {
                case .superAdmin: return ViewPath.AdminPanel.Layout.Sidebars.superAdmin
                case .admin: return ViewPath.AdminPanel.Layout.Sidebars.admin
                case .user: return ViewPath.AdminPanel.Layout.Sidebars.user
                }
            },
            resetSigner: .hs256(
                key: env(EnvironmentKey.AdminPanel.signerKey, "secret-reset-admin")),
            environment: environment
        )
    }
}

extension BugsnagConfig {
    static func current(_ environment: Environment) -> BugsnagConfig {
        return BugsnagConfig(
            apiKey: env(EnvironmentKey.Bugsnag.key, ""),
            releaseStage: environment.name
        )
    }
}

extension CORSMiddleware.Configuration {
    static var current: CORSMiddleware.Configuration {
        return CORSMiddleware.Configuration(
            allowedOrigin: .all,
            allowedMethods: [.GET, .POST, .PUT, .OPTIONS, .DELETE, .PATCH],
            allowedHeaders: [
                .accept,
                .accessControlAllowOrigin,
                .authorization,
                .contentType,
                .origin,
                .userAgent,
                .xRequestedWith,
                HTTPHeaderName(NMetaConfig.current.headerKey)
            ]
        )
    }
}

extension MySQLDatabaseConfig {
    static var current: MySQLDatabaseConfig {
        guard
            let url = env(EnvironmentKey.MySQL.url),
            let throwableConfig = try? MySQLDatabaseConfig(url: url),
            let config = throwableConfig
        else {
            return MySQLDatabaseConfig(
                hostname: env(EnvironmentKey.MySQL.hostname, "127.0.0.1"),
                username: env(EnvironmentKey.MySQL.username, "root"),
                password: env(EnvironmentKey.MySQL.password, ""),
                database: env(
                    EnvironmentKey.MySQL.database,
                    ProjectConfig.current.name.lowercased()
                )
            )
        }

        return config
    }
}

extension NMetaConfig {
    static var current: NMetaConfig {
        return NMetaConfig(
            exceptPaths: [
                // favicons
                "/apple-touch-icon-precomposed.png",
                "/apple-touch-icon.png",
                "/favicon.ico",
                "/favicons/*",

                "/AdminPanel/*",
                "/NodesSSO/*",
                "/Reset/*",
                "/admin*",
                "/api/users/reset-password/*",
                "/css/*",
                "/images/*",
                "/js/*",
                "/robots.txt"
            ]
        )
    }
}

extension OffsetPaginatorConfig {
    static var current: OffsetPaginatorConfig {
        return  OffsetPaginatorConfig(
            perPage: 25,
            defaultPage: 1
        )
    }
}

extension ProjectConfig {
    static var current: ProjectConfig {
        return ProjectConfig(
            name: env(EnvironmentKey.Project.name, "ServerSideSwift"),
            url: env(EnvironmentKey.Project.url, "http://localhost:8080"),
            resetPasswordEmail: .init(
                fromEmail: "info@serversideswift.info",
                subject: "Reset Password"
            ),
            setPasswordEmail: .init(
                fromEmail: "info@serversideswift.info",
                subject: "Set Password"
            )
        )
    }
}

extension RedisClientConfig {
    static var current: RedisClientConfig {
        guard
            let urlString = env(EnvironmentKey.Redis.url),
            let url = URL(string: urlString)
        else {
            var components = URLComponents()
            components.host = env(EnvironmentKey.Redis.hostname, "127.0.0.1")
            components.port = 6379
            components.scheme = "redis"
            components.path = "/" + env(EnvironmentKey.Redis.database, "0")

            if let url = components.url {
                return .init(url: url)
            } else {
                return .init()
            }
        }

        return RedisClientConfig(url: url)
    }
}

extension ResetResponses {
    static var current: ResetResponses {
        return .init(
            resetPasswordRequestForm: { req in
                try HTTPResponse(status: .notFound).encode(for: req)
            },
            resetPasswordUserNotified: { req in
                try HTTPResponse(status: .noContent).encode(for: req)
            },
            resetPasswordForm: { req, user in
                try req
                    .make(LeafRenderer.self)
                    .render(ViewPath.Reset.form)
                    .encode(for: req)
            },
            resetPasswordSuccess: { req, user in
                try req
                    .make(LeafRenderer.self)
                    .render(ViewPath.Reset.success)
                    .encode(for: req)
            }
        )
    }
}
