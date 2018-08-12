//
//  Models+MySQLSupport.swift
//  App
//
//  Created by Federico Trimboli on 12/08/2018.
//

import FluentMySQL
import Vapor
import Models

// MARK: - Todo

/// Allows `Todo` to be persisted in a database.
extension Todo: MySQLModel { }

/// Allows `Todo` to be used as a dynamic migration.
extension Todo: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Todo: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Todo: Parameter { }

// MARK: - Review
extension Review: MySQLModel { }
extension Review: Migration { }
extension Review: Content { }
extension Review: Parameter { }

// MARK: - Speaker
extension Speaker: MySQLModel { }
extension Speaker: Migration { }
extension Speaker: Content { }
extension Speaker: Parameter { }

// MARK: - TechTalk
extension TechTalk: MySQLModel { }
extension TechTalk: Migration { }
extension TechTalk: Content { }
extension TechTalk: Parameter { }
