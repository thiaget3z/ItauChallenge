//
//  ReceiptListViewControllerTests.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import XCTest
@testable import ItauChallenge

final class ReceiptListViewControllerTests: XCTestCase {
    var viewController: ReceiptListViewController?
    var interactorSpy: ReceiptListInteractorSpy?
    var presenterSpy: ReceiptListPresenterSpy?
    var workerSpy: ReceiptListWorkerSpy?
    var routerSpy: ReceiptListRouterSpy?
    var receipt: ReceiptEntity?

    override func setUp() {
        super.setUp()
        
        let controller = ReceiptListViewController()
        let workerSpy = ReceiptListWorkerSpy()
        let presenterSpy = ReceiptListPresenterSpy(viewController: controller)
        let interactorSpy = ReceiptListInteractorSpy(presenter: presenterSpy, worker: workerSpy)
        let routerSpy = ReceiptListRouterSpy(viewController: controller, dataStore: interactorSpy)
        controller.interactor = interactorSpy
        controller.router = routerSpy
        
        receipt = ReceiptEntity(title: "Titulo", receiptId: "123", name: "Name", receiverName: "Receiver Name", amount: "R$ 100,00", control: "ABCD", date: "qua, 27 de abril de 2022")
        self.viewController = controller
        self.interactorSpy = interactorSpy
        self.presenterSpy = presenterSpy
        self.workerSpy = workerSpy
        self.routerSpy = routerSpy
    }

    override func tearDown() {
        viewController = nil
        interactorSpy = nil
        super.tearDown()
    }

    func testViewDidLoadCallsInteractorFetchReceipts() {
        // Given
        guard let viewController = self.viewController, let interactorSpy = interactorSpy else {
            XCTFail("Should not be nil")
            return
        }
        
        // When
        viewController.viewDidLoad()
        
        // Then
        XCTAssertTrue(interactorSpy.fetchReceiptsCalled)
    }
    
    func testDidSelectReceiptCallsRouter() {
        // Given
        guard let viewController = self.viewController, let routerSpy = routerSpy, let receipt = receipt else {
            XCTFail("Should not be nil")
            return
        }
        
        // When
        viewController.didSelectReceipt(receipt: receipt)
        
        // Then
        XCTAssertTrue(routerSpy.routeToDetailCalled)
        XCTAssertEqual(routerSpy.receipt?.receiptId, receipt.receiptId)
    }
    
}
