//
//  ReceiptDetailPresenterSpy.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import XCTest
@testable import ItauChallenge

class ReceiptDetailPresenterSpy: ReceiptDetailPresentationLogic {
    var presenter: ReceiptDetailPresentationLogic
    var presentReceiptsCalled = false
    var responseReceived: ReceiptDetail.RequestReceiptDetail.Response?
    
    init(viewController: ReceiptDetailDisplayLogic) {
        self.presenter = ReceiptDetailPresenter(viewController: viewController)
    }
    
    func presentReceipt(response: ReceiptDetail.RequestReceiptDetail.Response) {
        presentReceiptsCalled = true
        responseReceived = response
        presenter.presentReceipt(response: response)
    }
}
