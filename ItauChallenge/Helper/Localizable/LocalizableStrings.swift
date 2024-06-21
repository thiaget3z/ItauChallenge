//
//  LocalizableStrings.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 21/06/24.
//

import Foundation

enum LocalizableStrings: String {
    //MARK: ReceiptList
    case receiptListTitle = "receiptListTitle"
    
    //MARK: ReceiptDetail
    case receiptDetailReceiptId = "receiptDetailReceiptId"
    case receiptDetailData = "receiptDetailData"
    case receiptDetailReceiverName = "receiptDetailReceiverName"
    case receiptDetailName = "receiptDetailName"
    
    //MARK: Localized
    func localized() -> String { return NSLocalizedString(rawValue, comment: String()) }
}

