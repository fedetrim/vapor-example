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
    
    func index(_ req: Request) -> Future<TechTalkDTO> {
        return TechTalk.query(on: req)
            .join(\Review.techTalkID, to: \TechTalk.id)
            .alsoDecode(Review.self)
            .all()
            .map(to: TechTalkDTO.self) { data in
                let speaker = Speaker(firstName: "", lastName: "", photoURL: URL(string: "www.google.com")!, githubURL: URL(string: "www.google.com")!)
                let techTalkDTO = TechTalkDTO(id: 50, title: "", description: "", speaker: speaker, reviews: [])
                return techTalkDTO
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
