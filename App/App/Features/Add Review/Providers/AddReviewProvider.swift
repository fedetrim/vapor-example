//
//  AddReviewProvider.swift
//  App
//
//  Created by Nahuel Zapata on 8/15/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import Foundation
import Moya
import Result

class AddReviewProvider: AddReviewProvidable {
    func provide(reviewId id: Int?, request: AddReview.Save.Request, completion: @escaping (Result<Review, NSError>) -> Void) {
        let provider = MoyaProvider<AddReviewEndpoint>()
        let review = Review(id: nil, description: request.description, stars: request.stars, reviewerEmail: request.email)

        provider.request(AddReviewEndpoint.add(id: id!, review: review)) { result in
            do {
                let response = try result.dematerialize()
                let json = try response.mapJSON()
                print(json)

                completion(.success(try response.map(Review.self)))
            } catch {
                completion(.failure(NSError(domain: "Provider Error", code: 600, userInfo: nil)))
            }
        }
    }
}
