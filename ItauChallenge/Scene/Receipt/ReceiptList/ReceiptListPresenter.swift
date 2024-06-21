//
//  ReceiptListPresenter.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import UIKit

protocol ReceiptListPresentationLogic {
    func presentReceipt(response: ReceiptList.FetchReceipts.Response)
}

class ReceiptListPresenter: ReceiptListPresentationLogic {
    
    weak var viewController: ReceiptListDisplayLogic?
    
    init(viewController: ReceiptListDisplayLogic) {
        self.viewController = viewController
    }
    
    // MARK: Do something
    
    func presentReceipt(response: ReceiptList.FetchReceipts.Response) {
        let viewModel = ReceiptList.FetchReceipts.ViewModel(displayReceipts: response.receipts,
                                                            displayPagination: response.pagination)
        
        viewController?.displayReceipt(viewModel: viewModel)
    }
}
