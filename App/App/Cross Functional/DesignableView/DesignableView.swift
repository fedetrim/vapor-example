//
//  DesignableView.swift
//  App
//
//  Created by Nahuel Zapata on 8/12/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class DesignableView: UIView {

    private weak var proportionalHeightConstraint: NSLayoutConstraint?

    @IBOutlet var contentView: UIView!

    @IBInspectable var heightProportion: CGFloat = 0 {
        didSet {
            self.updateHeight()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.xibSetup()
    }

    func xibSetup() {
        self.contentView = self.loadFromNib(self.xibName())
        self.contentView.frame = bounds
        self.addSubview(self.contentView)
        self.contentView?.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        let views = ["view": self.contentView!]
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: .alignAllTop, metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: .alignAllTop, metrics: nil, views: views)
        NSLayoutConstraint.activate(constraints)
        self.updateHeight()
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.updateHeight()
    }

    func xibName() -> String { return "" }

    private func updateHeight() {
        if self.heightProportion <= 0 {
            return
        }
        self.proportionalHeightConstraint?.isActive = false
        if let superview = self.superview {
            self.proportionalHeightConstraint = self.heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: self.heightProportion)
            self.proportionalHeightConstraint?.isActive = true
        }
    }

}
protocol UIViewLoading { }

extension UIView: UIViewLoading { }

extension UIViewLoading where Self: UIView {
    
    static func loadFromNib(_ nibName: String? = nil) -> Self {
        let bundle = Bundle(for: self)
        let probableName = "\(self)".split { $0 == "." }.map(String.init).last!
        let name = nibName ?? probableName
        let nib = UINib(nibName: name, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! Self
    }
    
    func loadFromNib(_ nibName: String) -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
