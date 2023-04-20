//
//  AssignQueryDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 08/04/23.
//

import Foundation
public class AssignQueryDataManager {
    public var databaseService: AssignQueryDatabaseServiceContract

    public init(databaseService: AssignQueryDatabaseServiceContract) {
        self.databaseService = databaseService
    }

    private func success(message: String, callback: (String) -> Void) {
        callback(message)
    }

    private func failure(message: String, callback: (String) -> Void) {
        if message == "No avaialable service is found " {
            let error = "Sevice with this service id Doesn't exist"
            callback(error)
        }
    }
}

extension AssignQueryDataManager: AssignQueryDataContract {
    public func assignQuery(employeeId: Int, queryId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.assignQuery(employeeId: employeeId, queryId: queryId, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
    }
}
