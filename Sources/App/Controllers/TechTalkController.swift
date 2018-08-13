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
    
    struct TechTalkDTO: TechTalkType, Content {
        var id: Int?
        var title: String
        var description: String
        var speaker: Speaker
        var reviews: [Review]
    }

    func index(_ req: Request) throws -> Future<[TechTalkDTO]> {
        return TechTalk.query(on: req).all().flatMap(to: [TechTalkDTO].self) { techTalks in
            let futures = try techTalks.map { techTalk -> Future<TechTalkDTO> in
                return try techTalk.reviews.query(on: req).all().map(to: TechTalkDTO.self) { reviews in
                    let dto = TechTalkDTO(id: techTalk.id,
                                          title: techTalk.title,
                                          description: techTalk.description,
                                          speaker: techTalk.speaker,
                                          reviews: reviews)
                    return dto
                }
            }

            return futures.flatten(on: req)
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
