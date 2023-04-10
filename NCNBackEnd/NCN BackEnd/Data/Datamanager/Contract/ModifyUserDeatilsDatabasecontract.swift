//
//  ModifyUserDeatilsDatabasecontract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
public protocol ModifyStringDetailsDatabaseContract {
    func modifyStringDetails(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
