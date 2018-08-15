//
//  Models.swift
//  App
//
//  Created by Federico Trimboli on 12/08/2018.
//

import ModelProtocols
import Vapor

#if os(macOS)
import FluentSQLite
typealias Model = SQLiteModel
typealias Connection = SQLiteConnection
typealias Database = SQLiteDatabase
#else
import FluentMySQL
typealias Model = MySQLModel
typealias Connection = MySQLConnection
typealias Database = MySQLDatabase
#endif

// MARK: - Review

struct Review: ReviewType, Codable {
    var id: Int?
    var description: String
    var stars: Double
    
    var techTalkID: TechTalk.ID
    var techTalk: Parent<Review, TechTalk> {
        return parent(\.techTalkID)
    }
}

extension Review: Model { }
extension Review: Migration {
    static func prepare(on conn: Connection) -> Future<Void> {
        return Database.create(self, on: conn) { builder in
            try addProperties(to: builder)
            builder.reference(from: \.techTalkID, to: \TechTalk.id)
        }
    }
}
extension Review: Content { }
extension Review: Parameter { }

// MARK: - Speaker

struct Speaker: SpeakerType, Codable {
    var id: Int?
    var firstName: String
    var lastName: String
    var photoURL: URL
    var githubURL: URL
    
    var techTalkID: TechTalk.ID
    var techTalk: Parent<Speaker, TechTalk> {
        return parent(\.techTalkID)
    }
}

extension Speaker: Model { }
extension Speaker: Migration {
    static func prepare(on conn: Connection) -> Future<Void> {
        return Database.create(self, on: conn) { builder in
            try addProperties(to: builder)
            builder.reference(from: \.techTalkID, to: \TechTalk.id)
        }
    }
}
extension Speaker: Content { }
extension Speaker: Parameter { }

// MARK: - TechTalk

struct TechTalk: TechTalkType, Codable {
    typealias Reviews = Children<TechTalk, Review>
    typealias Speakers = Children<TechTalk, Speaker>
    
    var id: Int?
    var title: String
    var description: String
    
    var speakers: Children<TechTalk, Speaker> {
        return children(\.techTalkID)
    }
    
    var reviews: Children<TechTalk, Review> {
        return children(\.techTalkID)
    }
}

extension TechTalk: Model { }
extension TechTalk: Migration {
    #if !os(macOS)
    static func prepare(on conn: Connection) -> Future<Void> {
        return Database.create(self, on: conn) { builder in
            builder.field(for: \.id, isIdentifier: true)
            builder.field(for: \.title)
            builder.field(for: \.description, type: .varchar(1000))
            
        }
    }
    #endif
}
extension TechTalk: Content { }
extension TechTalk: Parameter { }
