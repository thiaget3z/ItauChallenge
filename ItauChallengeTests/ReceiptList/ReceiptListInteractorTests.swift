//
//  ReceiptListInteractorTests.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import XCTest
@testable import ItauChallenge

final class ReceiptListInteractorTests: XCTestCase {

    var sut: ReceiptListInteractor?
    var presenter: ReceiptListPresenterSpy?
    var worker: ReceiptListWorkerSpy?
    var viewController: ReceiptListViewControllerSpy?
    
    override func setUp() {
        super.setUp()
        let viewController = ReceiptListViewControllerSpy()
        let presenter = ReceiptListPresenterSpy(viewController: viewController)
        let worker = ReceiptListWorkerSpy()
        self.viewController = viewController
        self.presenter = presenter
        self.worker = worker
        sut = ReceiptListInteractor(presenter: presenter, worker: worker)
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        presenter = nil
        worker = nil
        
        super.tearDown()
    }
    
    func testRequestReceiptsCallsPresentReceipt() {
        // Given
        guard let interactor = sut,
              let presenter = presenter,
              let worker = worker
        else {
            XCTFail("Should not be nil")
            return
        }
        
        // When
        interactor.requestReceipt(request: ReceiptList.FetchReceipts.Request())
        
        
        // Then
        XCTAssertTrue(presenter.presentReceiptsCalled)
        XCTAssertEqual(presenter.responseReceived?.receipts[0].receiptId, worker.receipt.receiptId)
        
    }
    
}
