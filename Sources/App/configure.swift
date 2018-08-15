#if os(macOS)
import FluentSQLite
#else
import FluentMySQL
#endif


import Vapor
import ModelProtocols

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    /// Register providers first
#if os(macOS)
    try services.register(FluentSQLiteProvider())
#else
    try services.register(FluentMySQLProvider())
#endif

    /// Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    /// Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

#if os(macOS)
    // Configure a SQLite database
    let sqlite = try SQLiteDatabase(storage: .memory)
#else
    // Configure a MySQL database
    let mySQL: MySQLDatabase = {
        let hostname = Environment.get("DATABASE_HOSTNAME") ?? "localhost"
        let username = Environment.get("DATABASE_USER") ?? "root"
        let password = Environment.get("DATABASE_PASSWORD") ?? "root"
        let database = Environment.get("DATABASE_DB") ?? "vapor-example"
        
        let config = MySQLDatabaseConfig(hostname: hostname,
                                         username: username,
                                         password: password,
                                         database: database)
        
        return MySQLDatabase(config: config)
    }()
#endif

    // Register the configured MySQL database to the database config.
    var databases = DatabasesConfig()
#if os(macOS)
    databases.add(database: sqlite, as: .sqlite)
#else
    databases.add(database: mySQL, as: .mysql)
#endif
    services.register(databases)

    /// Configure migrations
    var migrations = MigrationConfig()
#if os(macOS)
    migrations.add(model: Review.self, database: .sqlite)
    migrations.add(model: Speaker.self, database: .sqlite)
    migrations.add(model: TechTalk.self, database: .sqlite)
#else
    migrations.add(model: Review.self, database: .mysql)
    migrations.add(model: Speaker.self, database: .mysql)
    migrations.add(model: TechTalk.self, database: .mysql)
#endif
    services.register(migrations)

}
