//
//  ReceiptDetailPresenterTests.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import XCTest
@testable import ItauChallenge

final class ReceiptDetailPresenterTests: XCTestCase {
    var sut: ReceiptDetailPresenter?
    var viewController: ReceiptDetailViewControllerSpy?
    var receipt: ReceiptEntity?
    
    override func setUp() {
        super.setUp()
        let controller = ReceiptDetailViewControllerSpy()
        self.viewController = controller
        sut = ReceiptDetailPresenter(viewController: controller)
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
        let expectedReceiptId = String(format: LocalizableStrings.receiptDetailReceiptId.localized(), receipt.receiptId)
        let expectedReceiverName = String(format: LocalizableStrings.receiptDetailReceiverName.localized(), receipt.receiverName)
        let expectedName = String(format: LocalizableStrings.receiptDetailName.localized(), receipt.name)
        let formattedDate = formattedDate(date: receipt.date)
        let expectedDate = String(format: LocalizableStrings.receiptDetailData.localized(), formattedDate)
        
        let response = ReceiptDetail.RequestReceiptDetail.Response(receipt: receipt)
        
        // When
        presenter.presentReceipt(response: response)
        
        // Then
        XCTAssertTrue(viewControllerSpy.displayReceiptCalled)
        XCTAssertEqual(viewControllerSpy.viewModel?.amount, receipt.amount)
        XCTAssertEqual(viewControllerSpy.viewModel?.control, receipt.control)
        XCTAssertEqual(viewControllerSpy.viewModel?.title, receipt.title)
        XCTAssertEqual(viewControllerSpy.viewModel?.receiptId, expectedReceiptId)
        XCTAssertEqual(viewControllerSpy.viewModel?.receiverName, expectedReceiverName)
        XCTAssertEqual(viewControllerSpy.viewModel?.name, expectedName)
        XCTAssertEqual(viewControllerSpy.viewModel?.date, expectedDate)
    }
    
    private func formattedDate(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "EEE, dd 'de' MMMM 'de' yyyy"
        guard let formattedDate = dateFormatter.date(from: date) else {
            return date
        }
        
        dateFormatter.dateFormat = "EEEE, dd 'de' MMMM 'de' yyyy"
        return dateFormatter.string(from: formattedDate)
    }
    
}
