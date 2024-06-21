//
//  ReceiptListPresenterTests.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import XCTest
@testable import ItauChallenge

final class ReceiptListPresenterTests: XCTestCase {
    var sut: ReceiptListPresenter?
    var viewController: ReceiptListViewControllerSpy?
    var receipt: ReceiptEntity?
    
    override func setUp() {
        super.setUp()
        let controller = ReceiptListViewControllerSpy()
        self.viewController = controller
        sut = ReceiptListPresenter(viewController: controller)
        receipt = ReceiptEntity(title: "Titulo", receiptId: "123", name: "Name", receiverName: "Receiver Name", amount: "R$ 100,00", control: "ABCD", date: "qua, 27 de abril de 2022")
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        receipt = nil
        
        super.tearDown()
    }
    
    func testPresentReceiptsCallsDisplayReceipts() {
        
        // Given
        guard let presenter = sut,
              let viewControllerSpy = viewController,
              let receipt = receipt
        else {
            XCTFail("Should not be nil")
            return
        }
        
        let response = ReceiptList.FetchReceipts.Response(receipts: [receipt], pagination: PaginationEntity(page: 0, pageSize: 0, totalElements: 0, totalPages: 0))
        
        // When
        presenter.presentReceipt(response: response)
        
        // Then
        XCTAssertTrue(viewControllerSpy.displayReceiptCalled)
        XCTAssertEqual(viewControllerSpy.viewModel?.displayReceipts[0].receiptId, receipt.receiptId)
        
    }
    
}
