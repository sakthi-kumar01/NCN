//
//  ModifyEmployeeDetailsDatabaseService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 16/04/23.
//

import Foundation
public class ModifyEmployeeDetailsDatabaseService {
    var db = Database.shared

    public init() {}
}

extension ModifyEmployeeDetailsDatabaseService: ModifyEmployeeDetailsDatabaseContract {
    public func modifyEmployeeDetails(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        let columnName = ["userName", "password", "email", "mobileNumber"]
        let columnValue: [Any] = [userName, password, eMail, mobileNo]
        db.updateValue(tableName: "users", columnValue: columnValue, columnName: columnName, rowIdColumnName: "userId", rowIdValue: userId, success: success, failure: failure)
    }
    
    
    
    
}
