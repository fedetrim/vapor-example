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
    var photoUrl: String { get set }
    var githubUrl: String { get set }
}
