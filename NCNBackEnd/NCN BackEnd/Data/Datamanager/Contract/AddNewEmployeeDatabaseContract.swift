//
//  AddNewEmployeeDatabaseContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 24/03/23.
//

import Foundation
public protocol AddNewEmployeeDatabaseContract {
    func addEmployeeDetails(userName: String, password: String, email: String, mobilePhone: Int64, employeeType: Int, enterpriseId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
