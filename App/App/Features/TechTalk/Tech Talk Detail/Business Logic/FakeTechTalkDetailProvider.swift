//
//  FakeTechTalkDetailProvider.swift
//  App
//
//  Created by Nahuel Zapata on 8/12/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import Foundation
import Moya
import Result

protocol TechTalkDetailProvideable {
    func provide(techTalkId: Int, completion: @escaping (Result<TechTalk, NSError>) -> Void)
}

class FakeTechTalkDetailProvider: TechTalkDetailProvideable {
    func provide(techTalkId: Int, completion: @escaping (Result<TechTalk, NSError>) -> Void) {
        let provider = MoyaProvider<TechTalkDetailEndpoint>()

        provider.request(.detail(techTalkId)) { result in
            do {
                let response = try result.dematerialize()
                completion(.success(try response.map(TechTalk.self)))
            } catch {
                completion(.failure(NSError(domain: "FakeTechTalkDetailProvider Error", code: 600, userInfo: nil)))
            }
        }
    }
}
