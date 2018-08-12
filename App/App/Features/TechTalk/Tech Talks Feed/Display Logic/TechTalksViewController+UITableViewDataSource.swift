//
//  TechTalksViewController+UITableViewDataSource.swift
//  App
//
//  Created by Nahuel Zapata on 8/12/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import Foundation
import UIKit

extension TechTalksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return techTalks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TechTalkTableViewCell = tableView.dequeueReusableCell(for: indexPath)

        decorateTechTalkCell(cell, viewModel: techTalks[indexPath.row])

        return cell
    }

    func decorateTechTalkCell(_ cell: TechTalkTableViewCell, viewModel: TechTalks.TechTalkViewModel) {
        cell.updateSpeakerInfoViewInputs(fullName: viewModel.speakerName,
                                         photoImageUrl: viewModel.speakerPhoto,
                                         githubUrl: viewModel.speakerGithubUrl)

        cell.updateTechTalkViewInputs(title: viewModel.title, description: viewModel.description)
    }
}
