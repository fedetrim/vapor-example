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

    struct ReviewDTO: ReviewType, Content {
        var id: Int?
        var description: String
        var stars: Double
        var reviewerEmail: String
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

    func createReview(_ req: Request) throws -> Future<Review> {
        let techTalkID = try req.parameters.next(Int.self)
        return try req.content.decode(ReviewDTO.self).flatMap { dto in
            guard !dto.reviewerEmail.isEmpty else {
                throw Abort(.badRequest)
            }
            
            let review = Review(id: nil, description: dto.description, stars: dto.stars, reviewerEmail: dto.reviewerEmail, techTalkID: techTalkID)
            return review.save(on: req)
        }
    }

    func indexReview(_ req: Request) throws -> Future<[Review]> {
        let techTalkID = try req.parameters.next(Int.self)
        return Review.query(on: req).filter(\.techTalkID == techTalkID).all()
    }
}
