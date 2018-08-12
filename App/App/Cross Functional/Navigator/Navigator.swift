//
//  Navigator.swift
//  App
//
//  Created by Nahuel Zapata on 8/12/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import Foundation
import UIKit

class Navigator: Navigatable {
    init() { }

    func navigateToNextScene<T>(from source: T, to destination: T) where T: UIViewController {
        source.navigationController?.pushViewController(destination, animated: true)
    }
}
