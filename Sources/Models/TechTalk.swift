//
//  TechTalk.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

public protocol TechTalkable {
    var title: String { get set }

    var description: String { get set }

    var speaker: Speaker { get set }

    var reviews: [Review] { get set }
}

public struct TechTalk: Codable, TechTalkable, Identable {
    public var id: Int

    public var title: String

    public var description: String

    public var speaker: Speaker

    public var reviews: [Review]
    
    public init(id: Int, title: String, description: String, speaker: Speaker, reviews: [Review]) {
        self.id = id
        self.title = title
        self.description = description
        self.speaker = speaker
        self.reviews = reviews
    }
}

public protocol Identable {
    var id: Int { get set }
}
