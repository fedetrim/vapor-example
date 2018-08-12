//
//  TechTalksViewController.swift
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

protocol TechTalksDisplayLogic: class {
    func displayTechTalks(viewModel: TechTalks.Load.ViewModel)
}

class TechTalksViewController: UIViewController {
    var interactor: TechTalksBusinessLogic?
    var router: (NSObjectProtocol & TechTalksRoutingLogic & TechTalksDataPassing)?
    var techTalks: [TechTalks.TechTalkViewModel] = []
    @IBOutlet var feedTableView: UITableView!

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
        let interactor = TechTalksInteractor()
        let presenter = TechTalksPresenter()
        let router = TechTalksRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestForTechTalks()
    }

    func setUpTableView() {
        feedTableView.dataSource = self
        feedTableView.registerNib(TechTalkTableViewCell.self)
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.feedTableView.reloadData()
        }
    }
}

extension TechTalksViewController: TechTalksDisplayLogic {
    func requestForTechTalks() {
        interactor?.performLoad(request: TechTalks.Load.Request())
    }

    func displayTechTalks(viewModel: TechTalks.Load.ViewModel) {
        do {
            self.techTalks = try viewModel.result.dematerialize()
            reloadTableView()
        } catch {
            // Display Error
        }
    }
}

extension TechTalksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return techTalks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TechTalkTableViewCell = tableView.dequeueReusableCell(for: indexPath)

        return cell
    }
}
