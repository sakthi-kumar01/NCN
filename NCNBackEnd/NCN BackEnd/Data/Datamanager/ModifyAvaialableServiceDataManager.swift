//
//  ModifyAvaialableServiceDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
public class ModifyAvailableServiceDataManager {
    public var databaseService: ModifyAvailableServiceDatabaseContract

    public init(databaseService: ModifyAvailableServiceDatabaseContract) {
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

extension ModifyAvailableServiceDataManager: ModifyAvailableServiceDataContract {
    public func modifyAvailableService(serviceId: Int, serviceTitle: String, serviceDescription: String, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.modifyAvailableService(serviceId: serviceId, serviceTitle: serviceTitle, serviceDescription: serviceDescription, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
    }
}
