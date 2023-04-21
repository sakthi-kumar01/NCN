//
//  UserLoginDatabaseServiceContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 17/03/23.
//

import Foundation
public protocol UserLoginDatabaseServiceContract {
    func userLogin(userName: String, password: String, success: @escaping (User) -> Void, failure: @escaping (String) -> Void)
}
