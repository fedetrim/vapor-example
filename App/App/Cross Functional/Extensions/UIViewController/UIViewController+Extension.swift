//
//  UIViewController+Extension.swift
//  App
//
//  Created by Nahuel Zapata on 8/15/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func changeNavigationTitle(_ title: String) {
        self.navigationItem.title = title
    }
    
    func displayError(title: String, description: String) {
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
