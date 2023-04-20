//
//  SetEnterpriseDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/03/23.
//

import Foundation
public class SetEnterpriseNameDataManager {
    var database: SetEnterpriseDatabaseServiceContract

    public init(database: SetEnterpriseDatabaseServiceContract) {
        self.database = database
    }

    private func success(message: String, callback: (String) -> Void) {
        callback(message)
    }

    private func failure(message: String, callback: (String) -> Void) {
        if message == "No Data" {
            let error = "User already exist"
            callback(error)
        }
    }
}

extension SetEnterpriseNameDataManager: SetEnterpriseNameDataContract {
    public func setEnterpriseName(enterpriseName: String, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        database.setEnterpriseName(enterpriseName: enterpriseName, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
    }
}
