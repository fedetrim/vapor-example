//
//  AddReviewEndpoint.swift
//  App
//
//  Created by Nahuel Zapata on 8/15/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import Foundation
import Moya

enum AddReviewEndpoint: TargetType {
    case add(id: Int, review: Review)

    var baseURL: URL {
        return URL(string: Environment().configuration(.serverURL))!
    }

    var path: String {
        switch self {
        case .add(let id, _):
            return "techTalks/\(id)/reviews"
        }
    }

    var method: Moya.Method {
        return .post
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .add(_, let review):
            return .requestJSONEncodable(review)
        }
    }

    var headers: [String: String]? {
        return [:]
    }
}

