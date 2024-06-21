//
//  ReceiptDetailViewControllerSpy.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import Foundation
@testable import ItauChallenge

class ReceiptDetailViewControllerSpy: ReceiptDetailDisplayLogic {
    var displayReceiptCalled = false
    var viewModel: ReceiptDetail.RequestReceiptDetail.ViewModel?
    
    func displayReceipt(viewModel: ReceiptDetail.RequestReceiptDetail.ViewModel) {
        displayReceiptCalled = true
        self.viewModel = viewModel
    }
}
