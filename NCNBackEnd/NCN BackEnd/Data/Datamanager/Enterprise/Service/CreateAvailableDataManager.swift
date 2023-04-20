//
//  CreateAvailableDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/03/23.
//

import Foundation
public class CreateAvaialableServicesDataManager {
    var database: CreateAvailableServicesDatabaseServiceContract

    public init(database: CreateAvailableServicesDatabaseServiceContract) {
        self.database = database
    }

    private func success(response: AvailableService, callback: (AvailableService) -> Void) {
        callback(response)
    }

    private func failure(response: String, callback: (String) -> Void) {
        if response == "No Data" {
            let error = "Service already exist. Data Not inserted"
            callback(error)
        }
    }
}

extension CreateAvaialableServicesDataManager: CreateAvailableServicesDataContract {
    public func createAvalableServices(serviceId: Int, serviceTitle: String, serviceDescritpion: String, success: @escaping (AvailableService) -> Void, failure: @escaping (String) -> Void) {
        database.createAvailableServices(serviceId: serviceId, seviceTitle: serviceTitle, serviceDescription: serviceDescritpion, success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
    }
}
