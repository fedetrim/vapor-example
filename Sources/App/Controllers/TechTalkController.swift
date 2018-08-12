//
//  TechTalkController.swift
//  App
//
//  Created by Federico Trimboli on 12/08/2018.
//

import FluentMySQL
import Vapor
import Models

final class TechTalkController {
    
    func index(_ req: Request) throws -> Future<[TechTalk]> {
        return TechTalk.query(on: req).all()
    }
    
    func create(_ req: Request) throws -> Future<TechTalk> {
        return try req.content.decode(TechTalk.self).flatMap { todo in
            return todo.save(on: req)
        }
    }

}

