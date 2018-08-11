//
//  PListKey.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

enum PlistKey {
    case serverURL

    func value() -> String {
        switch self {
        case .serverURL:
            return "serverURL"
        }
    }
}
