//
//  Speaker.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

public protocol SpeakerType {
    var id: Int? { get }
    var firstName: String { get }
    var lastName: String { get }
    var photoURL: URL { get }
    var githubURL: URL { get }
}
