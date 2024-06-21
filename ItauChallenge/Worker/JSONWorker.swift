//
//  JSONWorker.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 21/06/24.
//

import Foundation

enum JSONFileReaderError: Error {
    case decodeFailed
}

class JSONWorker: DataReceiverProtocol {
    func requestData<T: Decodable>(URI: String, type: T.Type, completion: @escaping ResponseResult<T>) throws {
        do {
            guard let jsonObject = try readLocalJSONFile(name: URI, type: type) else {
                completion(.failure(.requestFailed))
                return
            }
            completion(.success(jsonObject))
        } catch {
            completion(.failure(.requestFailed))
        }
        
    }
    
    
    func readLocalJSONFile<T: Decodable>(name: String, type: T.Type ) throws -> T? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return decodedData
            }
        } catch {
            throw JSONFileReaderError.decodeFailed
        }
        
        return nil
    }
    
    func parseJsonData<T: Decodable>(data: Data, type: T.Type ) throws -> T? {
        do {
            let decodedData = try JSONDecoder().decode(type.self, from: data)
            return decodedData
        } catch {
            throw JSONFileReaderError.decodeFailed
        }
    }
}
