//
//  SearchEmployeeDatabaseContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
public protocol SearchEmployeeDatabaseContract {
    func searchEmployee(employeeId: Int, success: @escaping ([Employee]) -> Void, failure: @escaping (String) -> Void)
}