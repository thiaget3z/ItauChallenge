//
//  ReceiptListWorkerSpy.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import XCTest
@testable import ItauChallenge

class ReceiptListWorkerSpy: ReceiptListWorker {
    var shouldFail = false
    var fetchReceiptsCalled = false
    var page: Int = 0
    var pageSize: Int = 0
    var receipt = ReceiptEntity(title: "Titulo", receiptId: "123", name: "Name", receiverName: "Receiver Name", amount: "R$ 100,00", control: "ABCD", date: "qua, 27 de abril de 2022")

    override func fetchReceipt(page: Int, pageSize: Int, completion: @escaping ReceiptResponse) {
        self.page = page
        self.pageSize = pageSize
        fetchReceiptsCalled = true
        
        
        shouldFail ? completion(.failure(.decodeFailed)) : completion(.success(([receipt], PaginationEntity(page: 0, pageSize: 0, totalElements: 0, totalPages: 0))))
    }
}
