//
//  ReviewTableViewCell.swift
//  App
//
//  Created by Nahuel Zapata on 8/14/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    @IBOutlet private var rateStarView: CosmosView!
    @IBOutlet private var reviewerLabel: UILabel!
    @IBOutlet private var reviewOpinion: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(rate: Double, reviewerName: String, opinion: String) {
        self.rateStarView.rating = rate
        self.reviewerLabel.text = reviewerName
        self.reviewOpinion.text = opinion
    }
}
