//
//  TechTalkDetailViewController.swift
//  App
//
//  Created by Nahuel Zapata on 8/12/18.
//  Copyright (c) 2018 Federico Trimboli. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TechTalkDetailDisplayLogic: class {
    func displayDetail(basedOn viewModel: TechTalkDetail.Load.ViewModel)
}

class TechTalkDetailViewController: UIViewController {
    var interactor: TechTalkDetailBusinessLogic?
    var router: (NSObjectProtocol & TechTalkDetailRoutingLogic & TechTalkDetailDataPassing)?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        let viewController = self
        let interactor = TechTalkDetailInteractor()
        let presenter = TechTalkDetailPresenter()
        let router = TechTalkDetailRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TechTalkDetailViewController: TechTalkDetailDisplayLogic {
    func displayDetail(basedOn viewModel: TechTalkDetail.Load.ViewModel) {

    }
}
