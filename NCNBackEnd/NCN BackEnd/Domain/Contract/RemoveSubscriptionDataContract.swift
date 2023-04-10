//
//  RemoveSubscriptionDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
public protocol RemoveSubscriptionDataContract {
   func removeSubscription(subscriptionId: Int, success: @escaping ([String]) -> Void, failure: @escaping (String) -> Void)
}
