//
//  Navigatable.swift
//  App
//
//  Created by Nahuel Zapata on 8/12/18.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import Foundation
import UIKit

protocol Navigatable: class {
    func navigateToNextScene<T>(from source: T, to destination: T) where T: UIViewController
}
