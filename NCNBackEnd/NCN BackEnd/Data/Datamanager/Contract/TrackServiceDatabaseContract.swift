//
//  TrackServiceDatabaseContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation

public protocol TrackServiceDatabaseContract {
    func trackService(employeeId: Int, success: @escaping ([Service]) -> Void, failure: @escaping (String) -> Void)
}
