//
//  RemoveUserDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
public class RemoveUserDataManager {
    public var databaseService: RemoveUserDatabaseContract

    public init(databaseService: RemoveUserDatabaseContract) {
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

extension RemoveUserDataManager: RemoveUserDataContract {
    public func removeUser(userId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.removeUser(userId: userId, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
        
    }
    
}
