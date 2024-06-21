//
//  ReceiptListPresenterSpy.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import XCTest
@testable import ItauChallenge

class ReceiptListPresenterSpy: ReceiptListPresentationLogic {
    var presenter: ReceiptListPresentationLogic
    var presentReceiptsCalled = false
    var responseReceived: ReceiptList.FetchReceipts.Response?
    
    init(viewController: ReceiptListDisplayLogic) {
        self.presenter = ReceiptListPresenter(viewController: viewController)
    }
    
    func presentReceipt(response: ReceiptList.FetchReceipts.Response) {
        presentReceiptsCalled = true
        responseReceived = response
        presenter.presentReceipt(response: response)
    }
}
