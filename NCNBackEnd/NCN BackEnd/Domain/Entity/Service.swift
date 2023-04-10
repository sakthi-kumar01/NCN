//
//  Service.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 17/03/23.
//

import Foundation
public struct Service {
    public var serviceId: Int
    public var serviceTitle: String
    public var serviceDescription: String
    public var isSubscribed: Bool
    public var subscriptionDeatail: [Subscription]
}
