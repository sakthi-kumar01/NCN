//
//  TrackServiceDatamanager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
public class TrackServiceDataManager {
    public var databaseService: TrackServiceDatabaseServiceContract

    public init(databaseService: TrackServiceDatabaseServiceContract) {
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

extension TrackServiceDataManager: TrackServiceDataContract {
    public func trackService(id: Int, subscriptionUsage:Int ,employeeId: Int, success: @escaping (
    String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.trackService(id: id, subscriptionUsage: subscriptionUsage, employeeId: employeeId, success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
    }
}
