//
//  Enterprise.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 17/03/23.
//

import Foundation
public struct Enterprise {
    var enterpriseName: String
    var subscription: [Subscription]?
    var admin: Admin?
    var employee: [Employee]?
    var clients: [Client]?
    var services: [AvailableService]?
    var enterpriseDomain: String {
        return "com." + enterpriseName
    }
}
