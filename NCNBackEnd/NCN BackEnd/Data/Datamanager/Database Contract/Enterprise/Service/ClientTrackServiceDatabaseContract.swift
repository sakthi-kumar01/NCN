//
//  ClientTrackServiceDatabaseServiceContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation

public protocol ClientTrackServiceDatabaseServiceContract {
    func ClientTrackService(id: Int, subscriptionUsage: Int, userId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
