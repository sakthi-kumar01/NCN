//
//  UserSignUpDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/04/23.
//

import Foundation
public protocol UserSignUpDataContract {
   func userSignUp(userName: String, password: String, email: String, mobileNumber: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
