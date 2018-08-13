//
//  TechTalkView.swift
//  App
//
//  Created by Nahuel Zapata on 8/12/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import Foundation
import UIKit

class TechTalkView: DesignableView {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func xibName() -> String {
        return "TechTalkView"
    }

    func updateInfo(title: String, description: String) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
}
