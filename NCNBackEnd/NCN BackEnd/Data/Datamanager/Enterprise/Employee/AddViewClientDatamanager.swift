//
//  AddViewClientDatamanager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
public class ViewAdminClientDataManager {
    public var databaseService: ViewAdminClientDatabaseServiceContract

    public init(databaseService: ViewAdminClientDatabaseServiceContract) {
        self.databaseService = databaseService
    }

    private func success(message: [User], callback: ([User]) -> Void) {
        callback(message)
    }

    private func failure(message: String, callback: (String) -> Void) {
        if message == "No avaialable service is found " {
            let error = "Sevice with this service id Doesn't exist"
            callback(error)
        }
    }
}

extension ViewAdminClientDataManager: ViewAdminClientDataContract {
    public func ViewAdminClient(employeeId: Int, success: @escaping ([User]) -> Void, failure: @escaping (String) -> Void) {
        databaseService.ViewAdminClient(employeeId: employeeId, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
    }
}
