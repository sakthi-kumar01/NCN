//
//  CreateAvailableSubscriptionDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 25/03/23.
//

import Foundation
public protocol CreateAvailableSubscriptionDataContract {
    func createAvailableSubscription(subscriptionId: Int, subscriptionPackageType: String, subscriptionConuntLimit: Float, subscriptionDaylimit: Int, serviceId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
