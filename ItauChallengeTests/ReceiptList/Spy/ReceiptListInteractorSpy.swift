//
//  ReceiptListInteractorSpy.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import XCTest
@testable import ItauChallenge

class ReceiptListInteractorSpy: ReceiptListBusinessLogic, ReceiptListDataStore {
    var presenter: ReceiptListPresentationLogic?
    var worker: ReceiptListWorkerProtocol?
    var requestReceived:  ReceiptList.FetchReceipts.Request?
    
    var fetchReceiptsCalled = false
    
    init(presenter: ReceiptListPresentationLogic, worker: ReceiptListWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func requestReceipt(request: ReceiptList.FetchReceipts.Request) {
        fetchReceiptsCalled = true
        // This Request is empty by default
        requestReceived = request
    }
}
