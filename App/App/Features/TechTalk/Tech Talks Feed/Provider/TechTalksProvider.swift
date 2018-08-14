//
//  TechTalksProvider.swift
//  App
//
//  Created by Federico Trimboli on 13/08/2018.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import Foundation
import Moya
import Result

class TechTalksProvider: TechTalksProvideable {
    func provide(completion: @escaping (Result<[TechTalk], NSError>) -> Void) {
        let provider = MoyaProvider<TechTalksEndpoint>()
        provider.request(.get) { result in
            do {
                let response = try result.dematerialize()

                completion(.success(try response.map([TechTalk].self)))
            } catch {
                completion(.failure(NSError(domain: "Provider Error", code: 600, userInfo: nil)))
            }
        }
    }
}

