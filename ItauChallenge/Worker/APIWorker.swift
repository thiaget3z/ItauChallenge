//
//  APIWorker.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 21/06/24.
//

import Foundation

enum APIWorkerError: Error {
    case networkError
    case urlError
}

class APIWorker: DataReceiverProtocol {
    
    let serviceURL = "https://demo3240175.mockable.io/"
    
    func requestData<T: Decodable>(URI: String, type: T.Type, completion: @escaping ResponseResult<T>) throws  {
        guard let url = URL(string: serviceURL + URI) else {
            throw APIWorkerError.urlError
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.requestFailed))
                return
            }
            
            let jsonWorker = JSONWorker()
            
            do {
                let jsonObject = try jsonWorker.parseJsonData(data: data, type: T.self)
                completion(.success(jsonObject))
            } catch {
                completion(.failure(.requestFailed))
            }
        }.resume()
        
    }
    
}


