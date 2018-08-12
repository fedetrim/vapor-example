//
//  Speaker.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

public protocol SpeakerType {
    var id: Int? { get set }
    var firstName: String { get set }
    var lastName: String { get set }
    var photoURL: URL { get set }
    var githubURL: URL { get set }
}
