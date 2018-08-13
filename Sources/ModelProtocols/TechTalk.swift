//
//  TechTalk.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

public protocol TechTalkType {
    associatedtype Speakers
    
    var id: Int? { get }
    var title: String { get }
    var description: String { get }
    var speakers: Speakers { get }
}
