//
//  Dequeueable.swift
//  SwiftBA-Client
//
//  Created by Nahuel Zapata on 8/10/18.
//  Copyright © 2018 iNahuelZapata. All rights reserved.
//

import Foundation
import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol DequeueableNib: class {
    static var nibName: String { get }
}

extension DequeueableNib where Self: UIView {
    static var nibName: String {
        var stringFromClass = String()

        if let stringDescribing = String(describing: self).components(separatedBy: ".").last {
            stringFromClass = stringDescribing
        }

        return stringFromClass
    }
}

extension UITableViewCell: ReusableView { }

extension UITableViewCell: DequeueableNib { }
