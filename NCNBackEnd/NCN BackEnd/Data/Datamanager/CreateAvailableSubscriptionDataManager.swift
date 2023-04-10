//
//  CreateAvailableSubscriptionDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 27/03/23.
//

import Foundation
public class CreateAvaialableSusbscriptionDataManager {
    public var databaseService: CreateAvailableSubscriptionDatabaseContract

    public init(databaseService: CreateAvailableSubscriptionDatabaseContract) {
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

extension CreateAvaialableSusbscriptionDataManager: CreateAvailableSubscriptionDataContract {
    public func createAvailableSubscription(subscriptionId: Int, subscriptionPackageType: String, subscriptionConuntLimit: Float, subscriptionDaylimit: Int, serviceId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.createAvaialableSubscription(subscriptionId: subscriptionId, subscriptionPackageType: subscriptionPackageType, subscriptionConuntLimit: subscriptionConuntLimit, subscriptionDaylimit: subscriptionDaylimit, serviceId: serviceId, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
    }
}
