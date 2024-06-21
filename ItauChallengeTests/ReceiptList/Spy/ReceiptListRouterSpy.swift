//
//  ReceiptListRouterSpy.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import XCTest
@testable import ItauChallenge

class ReceiptListRouterSpy: ReceiptListRoutingLogic, ReceiptListDataPassing {
    weak var viewController: ReceiptListViewController?
    var dataStore: ReceiptListDataStore?
    var receipt: ReceiptEntity?
    
    var routeToDetailCalled = false
    
    init(viewController: ReceiptListViewController, dataStore: ReceiptListDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
    
    func routeToDetail(receiptEntity: ReceiptEntity) {
        routeToDetailCalled = true
        let detailViewController = ReceiptDetailViewController()
        var dataStore = detailViewController.router?.dataStore
        dataStore?.receipt = receiptEntity
        receipt = receiptEntity
        viewController?.show(detailViewController, sender: nil)

    }

}
