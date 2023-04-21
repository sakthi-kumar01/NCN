//
//  ModifyAvaialableServiceDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
public class ModifyAvailableServiceDataManager {
    public var databaseService: ModifyAvailableServiceDatabaseServiceContract

    public init(databaseService: ModifyAvailableServiceDatabaseServiceContract) {
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

extension ModifyAvailableServiceDataManager: ModifyAvailableServiceDataContract {
    public func modifyAvailableService(serviceId: Int, serviceTitle: String, serviceDescription: String, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.modifyAvailableService(serviceId: serviceId, serviceTitle: serviceTitle, serviceDescription: serviceDescription, success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
    }
}
