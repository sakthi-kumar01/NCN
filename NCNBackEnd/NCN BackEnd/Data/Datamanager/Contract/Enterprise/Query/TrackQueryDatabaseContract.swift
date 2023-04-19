//
//  TrackQueryDatabaseContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
public protocol TrackQueryDatabaseContract {
    func trackQuery(employeeId: Int, success: @escaping ([Query]) -> Void, failure: @escaping (String) -> Void)
}
