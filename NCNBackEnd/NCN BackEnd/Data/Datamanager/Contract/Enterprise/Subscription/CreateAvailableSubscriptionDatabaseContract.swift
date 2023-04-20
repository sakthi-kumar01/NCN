//
//  CreateAvailableSubscriptionDatabaseServiceContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 27/03/23.
//

import Foundation
public protocol CreateAvailableSubscriptionDatabaseServiceContract {
    func createAvaialableSubscription(subscriptionId: Int, subscriptionPackageType: String, subscriptionConuntLimit: Float, subscriptionDaylimit: Int, serviceId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
