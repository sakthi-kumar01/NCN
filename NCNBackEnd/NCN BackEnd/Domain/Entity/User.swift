//
//  User.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 13/03/23.
//

import Foundation
public class User {
    public var userId: Int?
    public var userName: String
    public var email: String
    public var password: String
    public var mobileNumber: Int64
    public var enterpriseId: Int
    init(userName: String, email: String, password: String, mobileNumber: Int64, enterpriseId: Int) {
        self.userName = userName
        self.email = email
        self.password = password
        self.mobileNumber = mobileNumber
        self.enterpriseId = enterpriseId
    }
}
