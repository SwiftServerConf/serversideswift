import AdminPanel
import FluentMySQL
import Vapor

func migrate(migrations: inout MigrationConfig) throws {
    // MARK: Preparations
    migrations.add(model: AdminPanelUser.self, database: .mysql)
    migrations.add(model: Event.self, database: .mysql)
    migrations.add(model: Talk.self, database: .mysql)
    migrations.add(model: TalkSpeaker.self, database: .mysql)

    // MARK: Migrations
    // Add your migrations like this:
    // migrations.add(migration: AppUser.AddForeignKeyToAddressId.self, database: .mysql)
}
