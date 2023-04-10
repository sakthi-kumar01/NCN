//
//  CreateAvailabaleDatabaseContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/03/23.
//

import Foundation
public protocol CreateAvailableServicesDatabaseContract {
    func createAvailableServices(serviceId: Int, seviceTitle: String, serviceDescription: String, success: @escaping (AvailableService) -> Void, failure: @escaping (String) -> Void)
}
