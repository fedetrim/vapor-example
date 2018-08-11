//
//  Review.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

public protocol Reviewable {
    var description: String { get set }
    var stars: Double { get set }
}

public struct Review: Codable, Reviewable {
    public var description: String
    public var stars: Double
}
