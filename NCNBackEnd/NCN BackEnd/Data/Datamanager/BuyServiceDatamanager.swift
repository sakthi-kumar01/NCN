//
//  BuyServiceDatamanager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 29/03/23.
//

import Foundation
public class BuyServiceDataManager {
    public var databaseService: BuyServiceDatabaseContract

    public init(databaseService: BuyServiceDatabaseContract) {
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

extension BuyServiceDataManager: BuyServiceDataContract {
    public func buyService(userId: Int, employeeId: Int, serviceId: Int, subscriptionId subscriptionID: Int, enterpriseId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.buyService(userId: userId, employeeId: employeeId, serviceId: serviceId, subscritpionId: subscriptionID, enterpriseId: enterpriseId, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
    }
}
