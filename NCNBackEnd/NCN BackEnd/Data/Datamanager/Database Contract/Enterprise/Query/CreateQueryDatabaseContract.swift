//
//  CreateQueryDatabaseServiceContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 28/03/23.
//

import Foundation
public protocol CreateQueryDatabaseServiceContract {
    func createQuery(queryId: Int, queryType: QueryType, queryMessage: String, queryDate: Date, userId: Int, employeeId: Int, enterpriseId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
