//
//  ReceiptDetailViewSpy.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import Foundation
@testable import ItauChallenge

class ReceiptDetailViewSpy: ReceiptDetailView {
    var setupViewCalled = false
    var viewModelReceived: ReceiptDetail.RequestReceiptDetail.ViewModel?
    
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func setupView(receipt: ReceiptDetail.RequestReceiptDetail.ViewModel) {
        setupViewCalled = true
        viewModelReceived = receipt
        super.setupView(receipt: receipt)
    }
}
