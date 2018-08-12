//
//  Speaker.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

public protocol Speakerable {
    var firstName: String { get set }
    var lastName: String { get set }
    var photoUrl: String { get set }
    var githubUrl: String { get set }
}

public struct Speaker: Codable, Speakerable {
    public var id: Int?
    public var firstName: String
    public var lastName: String
    public var photoUrl: String
    public var githubUrl: String
    
    public init(firstName: String, lastName: String, photoUrl: String, githubUrl: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.photoUrl = photoUrl
        self.githubUrl = githubUrl
    }
}
