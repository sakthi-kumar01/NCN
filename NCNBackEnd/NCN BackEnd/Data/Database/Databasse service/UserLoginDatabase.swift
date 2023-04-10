//
//  UserLoginDatabase.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 13/03/23.
//

import Foundation
public class UserLoginDatabase: UserLoginDatabaseContract {
    let database = Database.shared

    public init() {}

    public func userLogin(userName: String, password: String, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        let values = database.selectQuery(columnString: "userName, password", tableName: "users", whereClause: "userName = \'\(userName)\' AND password = \'\(password)\'")

        if values != nil, values?[0]["userName"] as! String == userName, values?[0]["password"] as! String == password {
            success("Logged in")
        } else {
            failure("No Data")
        }
    }
}
