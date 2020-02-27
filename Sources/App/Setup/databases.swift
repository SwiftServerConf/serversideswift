import FluentMySQL
import Vapor

func databases(config: inout DatabasesConfig) throws {
    // MARK: MySQL

    config.add(database: MySQLDatabase(config: .current), as: .mysql)
}
