//
//  TechTalkDetailProvider.swift
//  App
//
//  Created by Nahuel Zapata on 8/15/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import Foundation
import Moya
import Result

class TechTalkDetailProvider: TechTalkDetailProvideable {
    func provide(techTalkId: Int, completion: @escaping (Result<[Review], NSError>) -> Void) {
        let provider = MoyaProvider<TechTalkDetailEndpoint>()
        provider.request(.detail(techTalkId)) { result in
            do {
                let response = try result.dematerialize()

                completion(.success(try response.map([Review].self)))
            } catch {
                completion(.failure(NSError(domain: "Provider Error", code: 600, userInfo: nil)))
            }
        }
    }
}
