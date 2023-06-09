//
//  ModifyUserDeatilsDatabaseServiceContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
public protocol ModifyUserDetailsDatabaseServiceContract {
    func modifyUserDetails(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
