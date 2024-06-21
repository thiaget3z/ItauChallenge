//
//  ReceiptDetailRouter.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import Foundation

// MARK: - Protocols

protocol ReceiptDetailRoutingLogic { }

protocol ReceiptDetailDataPassing {
    var dataStore: ReceiptDetailDataStore? { get set }
}

// MARK: - ReceiptDetailRouter

class ReceiptDetailRouter: ReceiptDetailRoutingLogic, ReceiptDetailDataPassing {
    weak var viewController: ReceiptDetailViewController?
    var dataStore: ReceiptDetailDataStore?
    
    init(viewController: ReceiptDetailViewController, dataStore: ReceiptDetailDataStore? = nil) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}
