//
//  TechTalkDetailViewController.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation
import UIKit
import Moya
import Models

class TechTalksDetailViewController: UIViewController {
    var techTalk: TechTalk!
    var provider = MoyaProvider<TechTalkDetailEndpoint>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func fetchTechTalkDetail() {
        provider.request(.detail(techTalk.id)) { (result) in
            do {
                let response = try result.dematerialize()
                self.techTalk = try response.map(TechTalk.self)
            } catch {
                // Display error
            }
        }
    }
}
