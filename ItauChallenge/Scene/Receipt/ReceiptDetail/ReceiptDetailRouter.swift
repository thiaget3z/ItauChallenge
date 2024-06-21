//
//  ReceiptDetailRouter.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.

import Foundation

protocol ReceiptDetailRoutingLogic { }

protocol ReceiptDetailDataPassing {
  var dataStore: ReceiptDetailDataStore? { get set }
}

class ReceiptDetailRouter: ReceiptDetailRoutingLogic, ReceiptDetailDataPassing {
  weak var viewController: ReceiptDetailViewController?
  var dataStore: ReceiptDetailDataStore?
  
  // MARK: Routing
  
}
