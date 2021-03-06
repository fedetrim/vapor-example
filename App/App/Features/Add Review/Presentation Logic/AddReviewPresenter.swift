//
//  AddReviewPresenter.swift
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

protocol AddReviewPresentationLogic {
    func presentSave(basedOn response: AddReview.Save.Response)
}

class AddReviewPresenter: AddReviewPresentationLogic {
    weak var viewController: AddReviewDisplayLogic?

    func presentSave(basedOn response: AddReview.Save.Response) {
        do {
            let review = try response.result.dematerialize()

            viewController?.displayOnSave(basedOn: AddReview.Save.ViewModel(result: .success(review)))
        } catch {
            viewController?.displayOnSave(basedOn: AddReview.Save.ViewModel(result: .failure(NSError(domain: error.localizedDescription, code: 400, userInfo: nil))))
        }
    }
}
