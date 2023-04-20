//
//  ViewEmployeeClientDatamanager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
public class ViewEmployeeClientDataManager {
    public var databaseService: ViewEmployeeClientDatabaseServiceContract

    public init(databaseService: ViewEmployeeClientDatabaseServiceContract) {
        self.databaseService = databaseService
    }

    private func success(response: [User], callback: ([User]) -> Void) {
        callback(response)
    }

    private func failure(response: String, callback: (String) -> Void) {
        if response == "No avaialable service is found " {
            let error = "Sevice with this service id Doesn't exist"
            callback(error)
        }
    }
}

extension ViewEmployeeClientDataManager: ViewEmployeeClientDataContract {
    public func ViewEmployeeClient(employeeId: Int, success: @escaping ([User]) -> Void, failure: @escaping (String) -> Void) {
        databaseService.ViewEmployeeClient(employeeId: employeeId, success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
    }
}
