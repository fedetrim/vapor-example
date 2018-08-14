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
        var speakers: [Speaker]
    }

    func index(_ req: Request) throws -> Future<[TechTalkDTO]> {
        return TechTalk.query(on: req).all().flatMap(to: [TechTalkDTO].self) { techTalks in
            let futures = try techTalks.map { techTalk -> Future<TechTalkDTO> in
                return try techTalk.speakers.query(on: req).all().map(to: TechTalkDTO.self) { speakers in
                    let dto = TechTalkDTO(id: techTalk.id,
                                          title: techTalk.title,
                                          description: techTalk.description,
                                          speakers: speakers)
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
    
    struct ReviewDTO: ReviewType, Content {
        var id: Int?
        var description: String
        var stars: Double
    }
    
    func createReview(_ req: Request) throws -> Future<Review> {
        let techTalkID = try req.parameters.next(Int.self)
        return try req.content.decode(ReviewDTO.self).flatMap { dto in
            let review = Review(id: nil, description: dto.description, stars: dto.stars, techTalkID: techTalkID)
            return review.save(on: req)
        }
    }

}

final class SpeakerController {
    
    func create(_ req: Request) throws -> Future<Speaker> {
        return try req.content.decode(Speaker.self).flatMap { speaker in
            return speaker.save(on: req)
        }
    }
    
}
