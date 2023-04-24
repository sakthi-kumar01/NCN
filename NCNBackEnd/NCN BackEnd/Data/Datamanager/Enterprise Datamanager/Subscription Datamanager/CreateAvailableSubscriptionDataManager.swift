//
//  CreateAvailableSubscriptionDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 27/03/23.
//

import Foundation
public class CreateAvailableSusbscriptionDataManager {
    public var databaseService: CreateAvailableSubscriptionDatabaseServiceContract

    public init(databaseService: CreateAvailableSubscriptionDatabaseServiceContract) {
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

extension CreateAvailableSusbscriptionDataManager: CreateAvailableSubscriptionDataContract {
    public func createAvailableSubscription(subscriptionId: Int, subscriptionPackageType: String, subscriptionConuntLimit: Float, subscriptionDaylimit: Int, serviceId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.createAvaialableSubscription(subscriptionId: subscriptionId, subscriptionPackageType: subscriptionPackageType, subscriptionConuntLimit: subscriptionConuntLimit, subscriptionDaylimit: subscriptionDaylimit, serviceId: serviceId, success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
    }
}
