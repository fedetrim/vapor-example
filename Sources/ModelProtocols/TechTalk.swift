//
//  TechTalk.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

public protocol TechTalkType {
    associatedtype Reviews
    associatedtype Speaker
    
    var id: Int? { get set }
    var title: String { get set }
    var description: String { get set }
    var speaker: Speaker { get set }
    var reviews: Reviews { get set }
}
