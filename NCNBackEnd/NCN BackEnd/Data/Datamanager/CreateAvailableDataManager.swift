//
//  CreateAvailableDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/03/23.
//

import Foundation
public class CreateAvaialableServicesDataManager {
    var database: CreateAvailableServicesDatabaseContract

    public init(database: CreateAvailableServicesDatabaseContract) {
        self.database = database
    }

    private func success(message: AvailableService, callback: (AvailableService) -> Void) {
        callback(message)
    }

    private func failure(message: String, callback: (String) -> Void) {
        if message == "No Data" {
            let error = "Service already exist"
            callback(error)
        }
    }
}

extension CreateAvaialableServicesDataManager: CreateAvailableServicesDataContract {
    public func createAvalableServices(serviceId: Int, serviceTitle: String, serviceDescritpion: String, success: @escaping (AvailableService) -> Void, failure: @escaping (String) -> Void) {
        database.createAvailableServices(serviceId: serviceId, seviceTitle: serviceTitle, serviceDescription: serviceDescritpion, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
    }
}
