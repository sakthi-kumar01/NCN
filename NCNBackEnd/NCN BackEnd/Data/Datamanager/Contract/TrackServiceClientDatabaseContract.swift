//
//  TrackServiceClientDatabaseContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation

public protocol TrackClientServiceDatabaseContract {
    func trackClientService(userId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
