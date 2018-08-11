//
//  TechTalksFeedViewController.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation
import UIKit
import Moya
import Models

class TechTalksFeedViewController: UIViewController {
    var techTalks: [TechTalkable] = []
    @IBOutlet var feedTableView: UITableView!
    var provider = MoyaProvider<TechTalksEndpoint>()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        fetchTalks()
    }

    func fetchTalks() {
        let stubProvider = MoyaProvider<TechTalksEndpoint>(stubClosure: MoyaProvider.immediatelyStub)
        stubProvider.request(.get) { (result) in
            do {
                let response = try result.dematerialize()
                
                self.techTalks = try response.map([TechTalk].self)
                DispatchQueue.main.async {
                    self.feedTableView.reloadData()
                }
            } catch {
                // Display error
            }
        }
    }

    func setUpTableView() {
        feedTableView.dataSource = self
        feedTableView.registerNib(TechTalkTableViewCell.self)
    }
}

extension TechTalksFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return techTalks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TechTalkTableViewCell = tableView.dequeueReusableCell(for: indexPath)

        return cell
    }
}
