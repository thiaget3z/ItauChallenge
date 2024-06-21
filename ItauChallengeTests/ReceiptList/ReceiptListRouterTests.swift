//
//  ReceiptListRouterTests.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import XCTest
@testable import ItauChallenge

final class ReceiptListRouterTests: XCTestCase {
    var navController: NavigationControllerSpy?
    var sut: ReceiptListRouter?
    var receipt = ReceiptEntity(title: "Titulo", receiptId: "123", name: "Name", receiverName: "Receiver Name", amount: "R$ 100,00", control: "ABCD", date: "qua, 27 de abril de 2022")
    
    override func setUp() {
        super.setUp()
        let viewController = ReceiptListViewController()
        self.navController = NavigationControllerSpy(rootViewController: viewController)
        sut = ReceiptListRouter(viewController: viewController)
    }
    
    func testRouteToDetail() {
        // Given
        guard let navController = navController, let router = sut else {
            XCTFail("Should not be nil")
            return
        }
        
        // When
        router.routeToDetail(receiptEntity: receipt)
        
        // Then
        XCTAssertTrue(navController.didCallPush)
        XCTAssert(navController.viewControllerToPresent is ReceiptDetailViewController)
    }
    
}
