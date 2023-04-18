//
//  TrackServiceDatamanager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
public class TrackServiceDataManager {
    public var databaseService: TrackServiceDatabaseContract

    public init(databaseService: TrackServiceDatabaseContract) {
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

extension TrackServiceDataManager: TrackServiceDataContract {
    public func trackService(id: Int, subscriptionUsage:Int ,employeeId: Int, success: @escaping (
    String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.trackService(id: id, subscriptionUsage: subscriptionUsage, employeeId: employeeId, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
    }
}
