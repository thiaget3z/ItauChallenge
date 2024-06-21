//
//  ReceiptDetailInteractor.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.

import Foundation

protocol ReceiptDetailBusinessLogic {
    func requestReceipt(request: ReceiptDetail.RequestReceiptDetail.Request)
}

protocol ReceiptDetailDataStore {
    var receipt: ReceiptEntity? { get set }
}

class ReceiptDetailInteractor: ReceiptDetailBusinessLogic, ReceiptDetailDataStore {
    var receipt: ReceiptEntity?
    var presenter: ReceiptDetailPresentationLogic?
    
    init(presenter: ReceiptDetailPresentationLogic) {
        self.presenter = presenter
    }
    
    func requestReceipt(request: ReceiptDetail.RequestReceiptDetail.Request) {
        guard let receipt = receipt else { return }
        let response = ReceiptDetail.RequestReceiptDetail.Response(receipt: receipt)
        presenter?.presentReceipt(response: response)
    }
    
}
