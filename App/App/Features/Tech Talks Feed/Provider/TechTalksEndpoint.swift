//
//  TechTalksEndpoint.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation
import Moya

enum TechTalksEndpoint: TargetType {
    case get

    var baseURL: URL {
        return URL(string: Environment().configuration(.serverURL))!
    }

    var path: String {
        return "techTalks"
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        let mock = MockTechTalksProvider.mock()
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
