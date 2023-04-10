//
//  Subscription.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 17/03/23.
//

import Foundation
public struct Subscription {
    public var startDate: Date
    public var endDate: Date
    public var subscriptionId: Int
    public var subscriptionPackageLimit: Float?
    public var subscriptionCountLimit: Int?
}
