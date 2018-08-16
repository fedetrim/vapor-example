//
//  MockTechTalkDetail.swift
//  App
//
//  Created by Nahuel Zapata on 8/15/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import Foundation
import ModelProtocols

final class MockTechTalkDetailProvider {

    private init() { }

    static func mock() -> [Review] {
        var reviews = [Review]()
        
        let firstReview = Review(id: 1, description: "Buenísimaaaaa", stars: 4.5, reviewerEmail: "inahuelzapata@gmail.com")
        
        let secondReview = Review(id: 2, description: "Pésima. El peor", stars: 1, reviewerEmail: "fede.trimboli@gmail.com")
        
        reviews.append(firstReview)
        reviews.append(secondReview)
        
        return reviews
    }
}
