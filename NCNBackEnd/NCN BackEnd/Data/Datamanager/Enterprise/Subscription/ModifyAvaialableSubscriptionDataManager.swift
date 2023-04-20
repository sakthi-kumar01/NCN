//
//  ModifyAvaialableSubscriptionDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
public class ModifyAvailableSubscriptionDataManager {
    public var databaseService: ModifyAvailableSubscriptionDatabaseContract

    public init(databaseService: ModifyAvailableSubscriptionDatabaseContract) {
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

extension ModifyAvailableSubscriptionDataManager: ModifyAvailableSubscriptionDataContract {
    public func modifyAvailableSubscription(subscriptionId: Int, subscriptionPackageType: String, subscriptionCountLimit: Float, subscriptionDayLimit: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.modifyAvailableSubscription(subscriptionId: subscriptionId, subscriptionPackageType: subscriptionPackageType, subscriptionCountLimit: subscriptionCountLimit, subscriptionDayLimit: subscriptionDayLimit, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
    }
}
