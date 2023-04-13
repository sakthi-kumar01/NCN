//
//  CreateAvaialableServiceDatabaseService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 13/04/23.
//

import Foundation
import Foundation
public class CreateAvailableServicesDatabase: CreateAvailableServicesDatabaseContract {
    public init() {}
    public func createAvailableServices(serviceId: Int, seviceTitle: String, serviceDescription: String, success: @escaping (AvailableService) -> Void, failure _: @escaping (String) -> Void) {
        let newservice = AvailableService(serviceId: serviceId, serviceTitle: seviceTitle, serviceDescription: serviceDescription)
        success(newservice)
    }
}
