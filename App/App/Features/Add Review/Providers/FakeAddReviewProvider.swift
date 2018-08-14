//
//  FakeAddReviewProvider.swift
//  App
//
//  Created by Nahuel Zapata on 8/13/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import Foundation
import Moya
import Result

protocol AddReviewProvidable {
    func provide(reviewId id: Int?,
                 request: AddReview.Save.Request,
                 completion: @escaping (Result<Review, NSError>) -> Void)
}

class FakeAddReviewProvider: AddReviewProvidable {
    func provide(reviewId id: Int?,
                 request: AddReview.Save.Request,
                 completion: @escaping (Result<Review, NSError>) -> Void) {
        completion(.success(Review(id: 1, description: "Muy buena", stars: 5)))
    }
}
