//
//  Pagination.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 20/06/24.
//

import Foundation

struct PaginationEntity: Decodable {
    let page: Int
    let pageSize: Int
    let totalElements: Int
    let totalPages: Int
}
