//
//  DataReceiverProtocol.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 21/06/24.
//

import Foundation

enum RequestError: Error {
    case requestFailed
}

typealias ResponseResult<T: Decodable> = (Result<T?, RequestError>) -> ()

protocol DataReceiverProtocol {
    func requestData<T:Decodable>(URI: String, type: T.Type, completion: @escaping ResponseResult<T> ) throws
}
