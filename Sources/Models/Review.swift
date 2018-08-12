//
//  Review.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation
import FluentMySQL

public protocol Reviewable {
    var description: String { get set }
    var stars: Double { get set }
}

public struct Review: Codable, Reviewable {
    public var id: Int?
    public var description: String
    public var stars: Double
    public var techTalkID: TechTalk.ID
    public var techTalk: Parent<Review, TechTalk> {
        return parent(\.techTalkID)
    }
}

// MARK: - Review
extension Review: MySQLModel { }
extension Review: Migration { }

// MARK: - Speaker
extension Speaker: MySQLModel { }
extension Speaker: Migration { }

// MARK: - TechTalk
extension TechTalk: MySQLModel { }
extension TechTalk: Migration { }
