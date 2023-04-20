//
//  CreateAvailableServicesDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/03/23.
//

import Foundation
import VTComponents
public protocol CreateAvailableServicesDataContract {
    func createAvalableServices(serviceId: Int, serviceTitle: String, serviceDescritpion: String, success: @escaping (AvailableService) -> Void, failure: @escaping (String) -> Void)
}
