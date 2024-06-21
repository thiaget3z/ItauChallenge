//
//  ReceiptDetailInteractorSpy.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import XCTest
@testable import ItauChallenge

class ReceiptDetailInteractorSpy: ReceiptDetailBusinessLogic, ReceiptDetailDataStore {
    var receipt: ReceiptEntity?
    var presenter: ReceiptDetailPresentationLogic?
    var requestReceived:  ReceiptDetail.RequestReceiptDetail.Request?
    
    var fetchReceiptsCalled = false
    
    init(presenter: ReceiptDetailPresentationLogic) {
        self.presenter = presenter
    }
    
    func requestReceipt(request: ReceiptDetail.RequestReceiptDetail.Request) {
        fetchReceiptsCalled = true
        // This Request is empty by default
        requestReceived = request
    }
}

