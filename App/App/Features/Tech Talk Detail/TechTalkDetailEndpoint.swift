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
        return URL(string: "https://swiftba-vapor-example.vapor.cloud")!
    }
    
    var path: String {
        switch self {
        case .detail(let id):
            return "/techTalks/\(id)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
}
