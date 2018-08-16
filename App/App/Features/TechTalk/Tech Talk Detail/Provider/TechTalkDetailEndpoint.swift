//
//  TechTalkDetailEndpoint.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/11/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation
import Moya

enum TechTalkDetailEndpoint: TargetType {
    case detail(Int)

    var baseURL: URL {
        return URL(string: Environment().configuration(.serverURL))!
    }

    var path: String {
        switch self {
        case .detail(let id):
            return "techTalks/\(id)/reviews"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        let mock = MockTechTalkDetailProvider.mock()
        let encoder = JSONEncoder()
        return try! encoder.encode(mock)
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        return [:]
    }
}
