//
//  ReceiptDetailViewControllerTests.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import XCTest
@testable import ItauChallenge

final class ReceiptDetailViewControllerTests: XCTestCase {
    var sut: ReceiptDetailViewController?
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
        
        self.sut = controller
        self.interactorSpy = interactorSpy
        self.presenterSpy = presenterSpy
        self.viewSpy = viewSpy
        
    }

    override func tearDown() {
        sut = nil
        interactorSpy = nil
        super.tearDown()
    }

    func testViewWillAppearCallsInteractorRequestReceipts() {
        // Given
        guard let viewController = sut, let interactorSpy = interactorSpy else {
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
        guard let viewController = sut, let receipt = receipt, let viewSpy = viewSpy else {
            XCTFail("Should not be nil")
            return
        }
        let viewModel = ReceiptDetail.RequestReceiptDetail.ViewModel(title: receipt.title, receiptId: receipt.receiptId, name: receipt.name, receiverName: receipt.receiverName, amount: receipt.amount, control: receipt.control, date: receipt.date)
        
        // When
        viewController.displayReceipt(viewModel: viewModel)
        
        // Then
        XCTAssertTrue(viewSpy.setupViewCalled)
        XCTAssertEqual(viewSpy.viewModelReceived?.receiptId, viewModel.receiptId)
    }
}
