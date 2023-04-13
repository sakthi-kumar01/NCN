//
//  SetEnterpriseNameDatabase.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/03/23.
//

import Foundation
public class SetEnterpriseDatabase: SetEnterpriseDatabaseContract {
    var db = Database.shared
    public var enterPrise: [Enterprise] = []

    public init() {}

    public func setEnterpriseName(enterpriseName: String, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        db.insertStatement(tableName: "enterprise", columnName: ["enterpriseName"], insertData: ["random"], success: success, failure: failure)
        
    }
}
