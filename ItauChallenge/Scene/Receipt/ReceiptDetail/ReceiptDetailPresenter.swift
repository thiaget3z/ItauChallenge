//
//  ReceiptDetailPresenter.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.

import Foundation

protocol ReceiptDetailPresentationLogic {
    func presentReceipt(response: ReceiptDetail.RequestReceiptDetail.Response)
}

class ReceiptDetailPresenter: ReceiptDetailPresentationLogic {
    weak var viewController: ReceiptDetailDisplayLogic?
    
    init(viewController: ReceiptDetailDisplayLogic) {
        self.viewController = viewController
    }
    
    func presentReceipt(response: ReceiptDetail.RequestReceiptDetail.Response)
    {
        let receiptViewModel = getFormattedReceipt(receipt: response.receipt)
        viewController?.displayReceipt(viewModel: receiptViewModel)
    }
    
    private func getFormattedReceipt(receipt: ReceiptEntity) -> ReceiptDetail.RequestReceiptDetail.ViewModel {
        let title = receipt.title
        let receiptId = String(format: LocalizableStrings.receiptDetailReceiptId.localized(), receipt.receiptId)
        let receiverName = String(format: LocalizableStrings.receiptDetailReceiverName.localized(), receipt.receiverName)
        let name = String(format: LocalizableStrings.receiptDetailName.localized(), receipt.name)
        let amount = receipt.amount
        let control = receipt.control
        let formattedDate = formattedDate(date: receipt.date)
        let date = String(format: LocalizableStrings.receiptDetailData.localized(), formattedDate)
        
        return ReceiptDetail.RequestReceiptDetail.ViewModel(title: title, receiptId: receiptId, name: name, receiverName: receiverName, amount: amount, control: control, date: date)
    }
    
    private func formattedDate(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = "EEE, dd 'de' MMMM 'de' yyyy"
        guard let formattedDate = dateFormatter.date(from: date) else {
            return date
        }
        
        dateFormatter.dateFormat = "EEEE, dd 'de' MMMM 'de' yyyy"
        return dateFormatter.string(from: formattedDate)
    }
}
