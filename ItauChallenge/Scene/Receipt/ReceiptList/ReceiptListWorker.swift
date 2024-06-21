//
//  ReceiptListWorker.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import Foundation

// MARK: - Typealiases

typealias ReceiptResponse = (Result<ReceiptListEntity, ReceiptListError>) -> Void

// MARK: - Enums

enum ReceiptListError: Error {
    case fetchReceiptFailed
}

// MARK: - Protocols

protocol ReceiptListWorkerProtocol: AnyObject {
    func fetchReceipt(page: Int, pageSize: Int, completion: @escaping ReceiptResponse)
}

// MARK: - ReceiptListWorker

class ReceiptListWorker: ReceiptListWorkerProtocol {
    
    private var dataWorker: DataReceiverProtocol?
    private let comprovanteURI = "comprovantes"
    var shouldFetchOffline = false
    
    // We can easily change this to work with a more elaborate AppConfiguration to change from API worker to JSON worker
    // or use dependency injection to use another worker
    init(dataWorker: DataReceiverProtocol? = nil) {
        guard let _ = dataWorker else {
            self.dataWorker = shouldFetchOffline ? JSONWorker() : APIWorker()
            return
        }
        
        self.dataWorker = dataWorker
    }
    
    // MARK: - Methods
    
    func fetchReceipt(page: Int, pageSize: Int, completion: @escaping ReceiptResponse) {
        do{
            try dataWorker?.requestData(URI: comprovanteURI, type: ReceiptDataEntity.self, completion: { result in
                
                switch result {
                case .success(let data):
                    guard let data = data else {
                        completion(.failure(.fetchReceiptFailed))
                        return
                    }
                    
                    completion(.success(data.receiptData))
                    
                case .failure(_):
                    completion(.failure(.fetchReceiptFailed))
                }
                
            })
        } catch {
            completion(.failure(.fetchReceiptFailed))
        }
    }
}
