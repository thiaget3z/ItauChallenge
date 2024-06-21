//
//  ReceiptDetailViewControllerTests.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import XCTest
@testable import ItauChallenge

final class ReceiptDetailViewControllerTests: XCTestCase {
    var viewController: ReceiptDetailViewController?
    var interactorSpy: ReceiptDetailInteractorSpy?
    var presenterSpy: ReceiptDetailPresenterSpy?
    var viewSpy: ReceiptDetailViewSpy?
    var receipt: ReceiptEntity?

    override func setUp() {
        super.setUp()
        
        let controller = ReceiptDetailViewController()
        let presenterSpy = ReceiptDetailPresenterSpy(viewController: controller)
        let interactorSpy = ReceiptDetailInteractorSpy(presenter: presenterSpy)
        let viewSpy = ReceiptDetailViewSpy()
        controller.receiptDetailView = viewSpy
        controller.interactor = interactorSpy
        receipt = ReceiptEntity(title: "Titulo", receiptId: "123", name: "Name", receiverName: "Receiver Name", amount: "R$ 100,00", control: "ABCD", date: "qua, 27 de abril de 2022")
        
        self.viewController = controller
        self.interactorSpy = interactorSpy
        self.presenterSpy = presenterSpy
        self.viewSpy = viewSpy
        
    }

    override func tearDown() {
        viewController = nil
        interactorSpy = nil
        super.tearDown()
    }

    func testViewWillAppearCallsInteractorRequestReceipts() {
        // Given
        guard let viewController = self.viewController, let interactorSpy = interactorSpy else {
            XCTFail("Should not be nil")
            return
        }
        
        // When
        viewController.viewDidLoad()
        viewController.viewWillAppear(false)
        
        // Then
        XCTAssertTrue(interactorSpy.fetchReceiptsCalled)
    }
    
    func testDisplayReceiptCallsSetupView() {
        // Given
        guard let viewController = self.viewController, let receipt = receipt, let viewSpy = viewSpy else {
            XCTFail("Should not be nil")
            return
        }
        
        // When
        presenterSpy?.presentReceipt(response: ReceiptDetail.RequestReceiptDetail.Response(receipt: receipt))
        
        // Then
        XCTAssertTrue(viewSpy.setupViewCalled)
        XCTAssertEqual(viewSpy.viewModelReceived?.control, receipt.control)
    }
}
