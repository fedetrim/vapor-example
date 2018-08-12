//
//  UIImageView+Extension.swift
//  App
//
//  Created by Nahuel Zapata on 8/12/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    func loadImageFrom(url: URL) {
        if let data = NSData(contentsOf: url) {
            self.image = UIImage(data: data as Data)
        }
    }
}
