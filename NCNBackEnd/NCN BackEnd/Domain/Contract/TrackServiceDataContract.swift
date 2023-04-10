//
//  TrackServiceDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
public protocol TrackServiceDataContract {
    func trackService(employeeId: Int, success: @escaping ([Service]) -> Void, failure: @escaping (String) -> Void)
}
