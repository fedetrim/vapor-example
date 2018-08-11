//
//  Environment.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation

struct Environment {

    fileprivate let infoDict: [String: Any] = {
        var infoDict = [String: Any]()

        if let dict = Bundle.main.infoDictionary {
            infoDict = dict
        }

        return infoDict
    }()

    func configuration(_ key: PlistKey) -> String {
        return getValue(by: key)
    }

    private func getValue(by key: PlistKey) -> String {
        guard let unwrappredValue = infoDict[key.value()] as? String else {
            return String()
        }
        return unwrappredValue
    }
}
