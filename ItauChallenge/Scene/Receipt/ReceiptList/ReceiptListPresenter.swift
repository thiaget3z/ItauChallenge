//
//  ReceiptListPresenter.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import UIKit

// MARK: - Protocols

protocol ReceiptListPresentationLogic {
    func presentReceipt(response: ReceiptList.FetchReceipts.Response)
}

// MARK: - ReceiptListPresenter

class ReceiptListPresenter: ReceiptListPresentationLogic {
    
    weak var viewController: ReceiptListDisplayLogic?
    
    init(viewController: ReceiptListDisplayLogic) {
        self.viewController = viewController
    }
    
    func presentReceipt(response: ReceiptList.FetchReceipts.Response) {
        let viewModel = ReceiptList.FetchReceipts.ViewModel(displayReceipts: response.receipts,
                                                            displayPagination: response.pagination)
        
        viewController?.displayReceipt(viewModel: viewModel)
    }
}
