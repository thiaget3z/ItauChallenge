//
//  ReceiptEntity.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 20/06/24.
//

import Foundation

struct ReceiptDataEntity: Decodable {
    let receiptData: ReceiptListEntity
    enum CodingKeys: String, CodingKey {
        case receiptData = "data"
    }
}

struct ReceiptListEntity: Decodable {
    let receipts: [ReceiptEntity]
}


struct ReceiptEntity: Decodable {
    let title: String
    let receiptId: String
    let name: String
    let receiverName: String
    let amount: String
    let control: String
    let date: String
    
}
