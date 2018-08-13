//
//  TechTalkTableViewCell.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/11/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import UIKit

class TechTalkTableViewCell: UITableViewCell {
    @IBOutlet private var techTalkView: TechTalkView!
    @IBOutlet private var speakerInfoView: SpeakerInfoView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateTechTalkViewInputs(title: String, description: String) {
        techTalkView.updateInfo(title: title, description: description)
    }
    
    func updateSpeakerInfoViewInputs(fullName: String, photoImageUrl: URL, githubUrl: URL) {
        speakerInfoView.update(fullName: fullName, photoImageUrl: photoImageUrl, githubUrl: githubUrl)
    }
}
