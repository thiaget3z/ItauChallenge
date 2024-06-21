//
//  ReceiptDetailModels.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.

import Foundation

enum ReceiptDetail {
    // MARK: Use cases
    
    enum RequestReceiptDetail {
        
        struct Request { }
        
        struct Response {
            let receipt: ReceiptEntity
        }
        
        struct ViewModel {
            let title: String
            let receiptId: String
            let name: String
            let receiverName: String
            let amount: String
            let control: String
            let date: String
        }
        
    }
}
