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
    @IBOutlet var speakerInfoView: SpeakerInfoView!
    @IBOutlet var techTalkView: TechTalkView!
    @IBOutlet var reviewsTableView: UITableView!

    var reviews: [TechTalkDetail.ReviewViewModel] = []

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
        setUpTableView()
        requestForDetail()
    }

    func setUpTableView() {
        reviewsTableView.dataSource = self
        reviewsTableView.delegate = self
        reviewsTableView.tableFooterView = UIView()
        reviewsTableView.backgroundColor = .lightGray
        reviewsTableView.registerNib(TechTalkTableViewCell.self)
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.reviewsTableView.reloadData()
        }
    }

    func requestForDetail() {
        interactor?.performLoad(basedOn: TechTalkDetail.Load.Request())
    }

    @IBAction func routeToAddReview(_ sender: Any) {
        router?.routeToAddReview()
    }
}

extension TechTalkDetailViewController: TechTalkDetailDisplayLogic {
    func displayDetail(basedOn viewModel: TechTalkDetail.Load.ViewModel) {
        do {
            let detailViewModel = try viewModel.result.dematerialize()

            speakerInfoView.update(fullName: detailViewModel.speakerName,
                                   photoImageUrl: detailViewModel.speakerPhoto,
                                   githubUrl: detailViewModel.speakerGithubUrl)
            techTalkView.updateInfo(title: detailViewModel.title,
                                    description: detailViewModel.description)
            self.navigationItem.title = detailViewModel.title
            self.reviews = detailViewModel.reviews

            reloadTableView()
        } catch {
            // Perform error handling
        }
    }
}

extension TechTalkDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension TechTalkDetailViewController: UITableViewDelegate {

}
