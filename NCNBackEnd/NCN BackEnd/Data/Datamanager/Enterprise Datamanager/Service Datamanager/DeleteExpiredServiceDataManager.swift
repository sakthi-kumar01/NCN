//
//  DeleteExpiredServiceDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
public class DeleteExpiredServiceDataManager {
    public var databaseService: DeleteExpiredServiceDatabaseServiceContract

    public init(databaseService: DeleteExpiredServiceDatabaseServiceContract) {
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

extension DeleteExpiredServiceDataManager: DeleteExpiredServiceDataContract {
    public func deleteExpiredService(success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.deleteExpiredService(success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
    }
}
