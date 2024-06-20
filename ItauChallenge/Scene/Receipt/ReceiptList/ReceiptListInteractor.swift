//
//  ReceiptListInteractor.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import UIKit

protocol ReceiptListBusinessLogic
{
    func requestReceipt(request: ReceiptList.FetchReceipts.Request)
}

protocol ReceiptListDataStore
{
    //var name: String { get set }
}

class ReceiptListInteractor: ReceiptListBusinessLogic, ReceiptListDataStore
{
    var presenter: ReceiptListPresentationLogic?
    var worker: ReceiptListWorkerProtocol?
    
    func requestReceipt(request: ReceiptList.FetchReceipts.Request)
    {
        worker?.fetchReceipt(page: 1, pageSize: 10, completion: { [self] result in
            switch result {
                
            case .success(let (receipts, pagination)):
                let response = ReceiptList.FetchReceipts.Response(receipts: receipts, pagination: pagination)
                presenter?.presentReceipt(response: response)
                
            case .failure(let error):
                switch error {
                
                case .decodeFailed:
                    print("Error")
                }
                
            }
        })
    }
}
