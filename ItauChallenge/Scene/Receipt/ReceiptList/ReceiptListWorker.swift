//
//  ReceiptListWorker.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import Foundation

typealias ReceiptResponse = (Result<([ReceiptEntity], PaginationEntity), ReceiptListError>) -> Void

enum ReceiptListError: Error {
    case decodeFailed
}

protocol ReceiptListWorkerProtocol: AnyObject
{
    func fetchReceipt(page: Int, pageSize: Int, completion: @escaping ReceiptResponse)
}

class ReceiptListWorker: ReceiptListWorkerProtocol
{
    func fetchReceipt(page: Int, pageSize: Int, completion: @escaping ReceiptResponse) {
        let data = readLocalJSONFile(name: "comprovantes") ?? Data()
        do {
            let decodedData = try JSONDecoder().decode(ReceiptDataEntity.self, from: data)
            let pagination = PaginationEntity(page: 1, pageSize: 10, totalElements: 10, totalPages: 1)
            completion(.success((decodedData.receiptData.receipts, pagination)))
        } catch {
            completion(.failure(.decodeFailed))
        }
    }
    
    func readLocalJSONFile(name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
