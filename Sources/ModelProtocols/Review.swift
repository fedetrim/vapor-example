//
//  Review.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

public protocol ReviewType {
    var id: Int? { get set }
    var description: String { get set }
    var stars: Double { get set }
}
