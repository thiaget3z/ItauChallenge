//
//  ReceiptListViewControllerSpy.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import Foundation
@testable import ItauChallenge

class ReceiptListViewControllerSpy: ReceiptListDisplayLogic {
    var displayReceiptCalled = false
    var viewModel: ReceiptList.FetchReceipts.ViewModel?
    
    func displayReceipt(viewModel: ReceiptList.FetchReceipts.ViewModel) {
        displayReceiptCalled = true
        self.viewModel = viewModel
    }
}
