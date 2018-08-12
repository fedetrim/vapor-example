//
//  Models.swift
//  App
//
//  Created by Federico Trimboli on 12/08/2018.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import ModelProtocols

// MARK: - Review

struct Review: ReviewType, Codable {
    var id: Int?
    var description: String
    var stars: Double
}

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

// MARK: - TechTalk

struct TechTalk: Codable {
    var id: Int
    var title: String
    var description: String
    var speaker: Speaker
    var reviews: [Review]
}
