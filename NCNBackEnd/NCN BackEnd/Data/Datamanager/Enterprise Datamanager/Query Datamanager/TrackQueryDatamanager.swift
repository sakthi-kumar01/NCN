//
//  TrackQueryDatamanager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import VTComponents
public class TrackQueryDataManager {
    public var databaseService: TrackQueryDatabaseServiceContract

    public init(databaseService: TrackQueryDatabaseServiceContract) {
        self.databaseService = databaseService
    }

    private func success(response: [Query], callback: ([Query]) -> Void) {
        callback(response)
    }

    private func failure(response: String, callback: (String) -> Void) {
        if response == "No avaialable service is found " {
            let error = "Sevice with this service id Doesn't exist"
            callback(error)
        }
    }
}

extension TrackQueryDataManager: TrackQueryDataContract {
    public func trackQuery(employeeId: Int, success: @escaping ([Query]) -> Void, failure: @escaping (String) -> Void) {
        databaseService.trackQuery(employeeId: employeeId, success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
    }
}
