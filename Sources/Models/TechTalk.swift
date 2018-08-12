//
//  TechTalk.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation
import FluentMySQL

public struct TechTalk: Codable, Identable {
    public var id: Int?

    public var title: String

    public var description: String

    public var speaker: Speaker

//    public var reviews: [Review]
    var reviews: Children<TechTalk, Review> {
        return children(\.techTalkID)
    }
    
//    public init(id: Int? = nil, title: String, description: String, speaker: Speaker, reviews: [Review]) {
//        self.id = id
//        self.title = title
//        self.description = description
//        self.speaker = speaker
//        self.reviews = reviews
//    }
}

public protocol Identable {
    var id: Int? { get set }
}
