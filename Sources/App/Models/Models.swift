//
//  Models.swift
//  App
//
//  Created by Federico Trimboli on 12/08/2018.
//

import ModelProtocols
import FluentMySQL
import Vapor

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

extension Review: MySQLModel { }
extension Review: Migration { }
extension Review: Content { }
extension Review: Parameter { }

// MARK: - Speaker

struct Speaker: SpeakerType, Codable {
    var id: Int?
    var firstName: String
    var lastName: String
    var photoUrl: String
    var githubUrl: String
    
    init(id: Int? = nil, firstName: String, lastName: String, photoUrl: String, githubUrl: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.photoUrl = photoUrl
        self.githubUrl = githubUrl
    }
}

extension Speaker: MySQLModel { }
extension Speaker: Migration { }
extension Speaker: Content { }
extension Speaker: Parameter { }

// MARK: - TechTalk

struct TechTalk: Codable {
    var id: Int?
    var title: String
    var description: String
    var speaker: Speaker
    
    var reviews: Children<TechTalk, Review> {
        return children(\.techTalkID)
    }
}

extension TechTalk: MySQLModel { }
extension TechTalk: Migration { }
extension TechTalk: Content { }
extension TechTalk: Parameter { }