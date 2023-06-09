//
//  BuyServiceDatamanager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 29/03/23.
//

import Foundation
public class BuyServiceDataManager {
    public var databaseService: BuyServiceDatabaseServiceContract

    public init(databaseService: BuyServiceDatabaseServiceContract) {
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

extension BuyServiceDataManager: BuyServiceDataContract {
    public func buyService(userId: Int, employeeId: Int, serviceId: Int, subscriptionId subscriptionID: Int, enterpriseId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.buyService(userId: userId, employeeId: employeeId, serviceId: serviceId, subscritpionId: subscriptionID, enterpriseId: enterpriseId, success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
    }
}
