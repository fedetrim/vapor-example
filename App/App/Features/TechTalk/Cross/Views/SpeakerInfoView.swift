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
    @IBOutlet private var githubUrlButton: UIButton!

    private var githubURL: URL?

    override func awakeFromNib() {
        super.awakeFromNib()
        setGithubUrlButtonAction()
    }

    func setGithubUrlButtonAction() {
        githubUrlButton.addTarget(self, action: #selector(showGithubURL), for: .touchUpInside)
    }

    override func xibName() -> String {
        return "SpeakerInfoView"
    }

    func update(fullName: String, photoImageUrl: URL, githubUrl: URL) {
        self.fullNameLabel.text = fullName
        self.photoImageView.loadImageFrom(url: photoImageUrl)
        self.githubURL = githubUrl
    }

    @objc
    func showGithubURL() {
        if let url = githubURL {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
