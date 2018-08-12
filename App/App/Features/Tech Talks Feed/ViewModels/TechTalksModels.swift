//
//  TechTalksModels.swift
//  App
//
//  Created by Nahuel Zapata on 8/12/18.
//  Copyright (c) 2018 Federico Trimboli. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation
import Models
import Result

enum TechTalks {

    enum Load {
        struct Request { }

        struct Response {
            var result: Result<[TechTalk], NSError>
        }

        struct ViewModel {
            var result: Result<[TechTalkViewModel], NSError>!
        }
    }

    struct TechTalkViewModel {
        var title: String
        var description: String
        var speakerName: String
        var speakerPhoto: String
        var speakerGithubUrl: String
    }
}
