//
//  ModifyAvailableSubscriptionDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
public protocol ModifyAvailableSubscriptionDataContract {
    func modifyAvailableSubscription(subscriptionId: Int, subscriptionPackageType: String, subscriptionCountLimit: Float, subscriptionDayLimit: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
