//
//  ReceiptListInteractor.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import UIKit

// MARK: - Protocols

protocol ReceiptListBusinessLogic {
    func requestReceipt(request: ReceiptList.FetchReceipts.Request)
}

protocol ReceiptListDataStore { }

// MARK: - ReceiptListInteractor

class ReceiptListInteractor: ReceiptListBusinessLogic, ReceiptListDataStore {
    
    // MARK: - Properties
    
    private var presenter: ReceiptListPresentationLogic?
    private var worker: ReceiptListWorkerProtocol?
    
    
    // MARK: - Constants
    let initialPage = 1
    let initialPageSize = 10
    
    // MARK: - Initializer
    
    init(presenter: ReceiptListPresentationLogic, worker: ReceiptListWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: - Business Logic
    
    func requestReceipt(request: ReceiptList.FetchReceipts.Request) {
        worker?.fetchReceipt(page: initialPage, pageSize: initialPageSize, completion: { [weak self] result in
          
            switch result {
            case .success(let receiptListEntity):
                let response = ReceiptList.FetchReceipts.Response(receipts: receiptListEntity.receipts, pagination: receiptListEntity.pagination)
                self?.presenter?.presentReceipt(response: response)
            case .failure(let error):
                // should call presenter to show error
                break
            }
            
        })
        
    }
}
