//
//  ModifyEmployeeDetailsDatabaseContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
public protocol ModifyEmployeeDetailsDatabaseContract {
    func modifyEmployeeDetails(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
