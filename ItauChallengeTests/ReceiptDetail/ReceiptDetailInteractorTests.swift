//
//  ReceiptDetailInteractorTests.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import XCTest
@testable import ItauChallenge

final class ReceiptDetailInteractorTests: XCTestCase {

    var sut: ReceiptDetailInteractor?
    var presenter: ReceiptDetailPresenterSpy?
    var viewController: ReceiptDetailViewControllerSpy?
    var receipt: ReceiptEntity?
    
    
    override func setUp() {
        super.setUp()
        let viewController = ReceiptDetailViewControllerSpy()
        let presenter = ReceiptDetailPresenterSpy(viewController: viewController)
        self.viewController = viewController
        self.presenter = presenter
        sut = ReceiptDetailInteractor(presenter: presenter)
        receipt = ReceiptEntity(title: "Titulo", receiptId: "123", name: "Name", receiverName: "Receiver Name", amount: "R$ 100,00", control: "ABCD", date: "qua, 27 de abril de 2022")
        sut?.receipt = receipt
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        presenter = nil
        
        super.tearDown()
    }
    
    func testRequestReceiptsCallsPresentReceipt() {
        // Given
        guard let interactor = sut,
              let presenter = presenter,
              let receipt = receipt
        else {
            XCTFail("Should not be nil")
            return
        }
        
        // When
        interactor.requestReceipt(request: ReceiptDetail.RequestReceiptDetail.Request())
        
        // Then
        XCTAssertTrue(presenter.presentReceiptsCalled)
        XCTAssertEqual(presenter.responseReceived?.receipt.receiptId, receipt.receiptId)
        
    }
    
}

