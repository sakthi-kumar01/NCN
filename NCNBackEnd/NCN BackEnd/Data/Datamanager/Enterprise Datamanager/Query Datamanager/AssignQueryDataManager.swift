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

    private func success(response: String, callback: (String) -> Void) {
        callback(response)
    }

    private func failure(response: String, callback: (String) -> Void) {
        if response == "No avaialable service is found " {
            let error = "Sevice with this service id Doesn't exist"
            callback(error)
        }
    }
}

extension AssignQueryDataManager: AssignQueryDataContract {
    public func assignQuery(employeeId: Int, queryId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.assignQuery(employeeId: employeeId, queryId: queryId, success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
    }
}
