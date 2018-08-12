//
//  SpeakerInfoView.swift
//  App
//
//  Created by Nahuel Zapata on 8/12/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import UIKit

class SpeakerInfoView: DesignableView {
    @IBOutlet private var fullNameLabel: UILabel!
    @IBOutlet private var photoImageView: UIImageView!
    @IBOutlet private var githubUrlLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func xibName() -> String {
        return "SpeakerInfoView"
    }

    func update(fullName: String, photoImageUrl: String, githubUrl: String) {
        self.fullNameLabel.text = fullName
        self.photoImageView.loadImageFrom(url: photoImageUrl)
        self.githubUrlLabel.text = githubUrl
    }
}
