//
//  Receipt.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import Foundation

enum ReceiptList
{
    // MARK: Use cases
    enum FetchReceipts
    {
        struct Request { }
        
        struct Response {
            let receipts: [ReceiptEntity]
            let pagination: PaginationEntity
        }
        
        struct ViewModel {
            let displayReceipts: [ReceiptEntity]
            let displayPagination: PaginationEntity
        }
    }
}
