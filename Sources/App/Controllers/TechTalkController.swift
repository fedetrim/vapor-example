//
//  TechTalkController.swift
//  App
//
//  Created by Federico Trimboli on 12/08/2018.
//

import FluentMySQL
import Vapor
import ModelProtocols

final class TechTalkController {
    
    struct TechTalkDTO: TechTalkType {
        var id: Int?
        var title: String
        var description: String
        var speaker: Speaker
        var reviews: [Review]
    }
    
    func index(_ req: Request) throws -> Future<View> {
        return TechTalk.query(on: req)
            .join(\Review.techTalkID, to: \TechTalk.id)
            .alsoDecode(Review.self)
            .all()
            .flatMap(to: View.self) { data in
                let reviews = data.map { args -> Review in
                    let (techTalk, review) = args
                    return review
                }
                
                return try req.view().render("reviews", reviews)
            }
    }
    
    func create(_ req: Request) throws -> Future<TechTalk> {
        return try req.content.decode(TechTalk.self).flatMap { techTalk in
            return techTalk.save(on: req)
        }
    }

}

final class ReviewController {
    
    func create(_ req: Request) throws -> Future<Review> {
        return try req.content.decode(Review.self).flatMap { review in
            return review.save(on: req)
        }
    }
    
}
