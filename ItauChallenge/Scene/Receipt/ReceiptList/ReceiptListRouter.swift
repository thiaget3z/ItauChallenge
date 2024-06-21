//
//  ReceiptListRouter.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import UIKit

// MARK: - Protocols

protocol ReceiptListRoutingLogic {
    func routeToDetail(receiptEntity: ReceiptEntity)
}

protocol ReceiptListDataPassing {
    var dataStore: ReceiptListDataStore? { get }
}

// MARK: - ReceiptListRouter

class ReceiptListRouter: ReceiptListRoutingLogic, ReceiptListDataPassing {
    private weak var viewController: ReceiptListViewController?
    var dataStore: ReceiptListDataStore?
    
    init(viewController: ReceiptListViewController, dataStore: ReceiptListDataStore? = nil) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
    
    // MARK: - Routing
    
    func routeToDetail(receiptEntity: ReceiptEntity) {
        let detailViewController = ReceiptDetailViewController()
        var dataStore = detailViewController.router?.dataStore
        dataStore?.receipt = receiptEntity
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
