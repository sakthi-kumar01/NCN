//
//  AddNewUserDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 17/03/23.
//

import Foundation
public protocol AddNewUserDataContract {
    func addNewUser(userName: String, password: String, email: String, mobileNumber: Int64, enterpriseId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
