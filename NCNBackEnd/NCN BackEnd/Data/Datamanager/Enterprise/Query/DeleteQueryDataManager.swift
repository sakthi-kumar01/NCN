//
//  DeleteQueryDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation

public class DeleteQueryDataManager {
    public var databaseService: DeleteQueryDatabaseContract

    public init(databaseService: DeleteQueryDatabaseContract) {
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

extension DeleteQueryDataManager: DeleteQueryDataContract {
    public func deleteQuery(queryId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.deleteQuery(queryId: queryId, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
        
    }
    
}
