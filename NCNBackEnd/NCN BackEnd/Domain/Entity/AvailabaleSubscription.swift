//
//  AvailabaleSubscription.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 21/03/23.
//

import Foundation
public struct AvailableSubscription {
    public var subscriptionId: Int
    public var subscriptionPackageType: String?
    public var subscriptionCountLimit: Int?
    public var subscritptionDayLimit: Int?
    public var serviceId: Int

    public init(subscriptionId: Int, subscriptionPackageType: String? = nil, subscriptionCountLimit: Int? = nil, subscritptionDayLimit: Int? = nil, serviceId: Int) {
        self.subscriptionId = subscriptionId
        self.subscriptionPackageType = subscriptionPackageType
        self.subscriptionCountLimit = subscriptionCountLimit
        self.subscritptionDayLimit = subscritptionDayLimit
        self.serviceId = serviceId
    }
}
