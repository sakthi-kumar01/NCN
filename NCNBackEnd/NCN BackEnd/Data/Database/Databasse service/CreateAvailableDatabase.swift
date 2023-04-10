//
//  CreateAvailableDatabase.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/03/23.
//

import Foundation
public class CreateAvailableServicesDatabase: CreateAvailableServicesDatabaseContract {
    public init() {}
    public func createAvailableServices(serviceId: Int, seviceTitle: String, serviceDescription: String, success: @escaping (AvailableService) -> Void, failure _: @escaping (String) -> Void) {
        let newservice = AvailableService(serviceId: serviceId, serviceTitle: seviceTitle, serviceDescription: serviceDescription)
        success(newservice)
    }
}
