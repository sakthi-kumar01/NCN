//
//  ViewAdminClientDatabaseServiceContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
public protocol ViewAdminClientDatabaseServiceContract {
    func ViewAdminClient(employeeId: Int, success: @escaping ([User]) -> Void, failure: @escaping (String) -> Void)
}
