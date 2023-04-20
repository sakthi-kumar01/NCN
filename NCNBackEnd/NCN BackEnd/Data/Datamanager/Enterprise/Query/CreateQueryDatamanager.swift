//
//  CreateQueryDatamanager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 28/03/23.
//

import Foundation
public class CreateQueryDatamanager {
    var databaseService: CreateQueryDatabaseServiceContract
    public init(databaseService: CreateQueryDatabaseServiceContract) {
        self.databaseService = databaseService
    }

    private func success(message: String, callback: (String) -> Void) {
        callback(message)
    }

    private func failure(message: String, callback: (String) -> Void) {
        if message == "Query type doesn't exist" {
            let error = "wrong querytype is used"
            callback(error)
        }
    }
}

extension CreateQueryDatamanager: CreateQueryDataContract {
    public func createQuery(queryId: Int, queryType: QueryType, queryMessage: String, queryDate: Date, userId: Int, employeeId: Int, enterpriseId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.createQuery(queryId: queryId, queryType: queryType, queryMessage: queryMessage, queryDate: queryDate, userId: userId, employeeId: employeeId, enterpriseId: enterpriseId, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
    }
}

//
// private func success(message: String, callback: (String) -> Void) {
//    callback(message)
// }
//
// private func failure(message: String, callback: (String) -> Void) {
//    if message == "No avaialable service is found " {
//        let error = "Sevice with this service id Doesn't exist"
//        callback(error)
//    }
// }
