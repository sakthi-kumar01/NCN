//
//  ModifyAvaialableServiceDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
public protocol ModifyAvailableServiceDataContract {
    func modifyAvailableService(serviceId: Int, serviceTitle: String, serviceDescription: String, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
