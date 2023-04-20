//
//  ViewSubscriptionDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 27/03/23.
//

import Foundation
public protocol ViewSubscriptionDataContract {
    func viewSubscription(success: @escaping ([AvailableSubscription]) -> Void, failure: @escaping (String) -> Void)
}
