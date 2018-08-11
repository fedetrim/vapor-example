//
//  ViewController.swift
//  App
//
//  Created by Federico Trimboli on 11/08/2018.
//  Copyright © 2018 Federico Trimboli. All rights reserved.
//

import UIKit
import Models

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let todo = Todo(id: nil, title: "Hola")
        print(todo)
    }

}
