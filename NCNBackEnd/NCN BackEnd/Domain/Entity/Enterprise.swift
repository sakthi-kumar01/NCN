//
//  Enterprise.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 17/03/23.
//

import Foundation
public struct Enterprise {
    public var enterpriseId: Int
    public var enterpriseName: String
    public var subscription: [Subscription]?
    public var admin: Admin?
    public var employee: [Employee]?
    public var clients: [Client]?
    public var services: [AvailableService]?
    public var enterpriseDomain: String {
        return "com." + enterpriseName
    }
}
