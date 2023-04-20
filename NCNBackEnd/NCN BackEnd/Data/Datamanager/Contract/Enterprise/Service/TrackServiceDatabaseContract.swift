//
//  TrackServiceDatabaseServiceContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation

public protocol TrackServiceDatabaseServiceContract {
    func trackService(id: Int, subscriptionUsage: Int, employeeId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
