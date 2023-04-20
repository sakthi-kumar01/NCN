//
//  ClientTrackServiceDatamanager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation

public class ClientTrackServiceDataManager {
    public var databaseService: ClientTrackServiceDatabaseServiceContract

    public init(databaseService: ClientTrackServiceDatabaseServiceContract) {
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

extension ClientTrackServiceDataManager: ClientTrackServiceDataContract {
    public func ClientTrackService(id: Int, subscriptionUsage: Int, userId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.ClientTrackService(id: id, subscriptionUsage: subscriptionUsage, userId: userId, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
    }
}
