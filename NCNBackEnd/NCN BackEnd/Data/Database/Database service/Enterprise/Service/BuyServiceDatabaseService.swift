//
//  BuyServicedatabaseService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 29/03/23.
//

import Foundation
public class BuyServiceDatabaseService: EnterpriseDatabaseService{
    public override init() {}
   
}

extension BuyServiceDatabaseService: BuyServiceDatabaseServiceContract {
    public func buyService(userId: Int, employeeId: Int, serviceId: Int, subscritpionId: Int, enterpriseId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        let queryColumnName = ["userId", "employeeId", "serviceId", "subscriptionId", "enterpriseId"]

        let queryColumnValue: [Any] = [userId, employeeId, serviceId, subscritpionId, enterpriseId]
        db.insertStatement(tableName: "serviceLinkTable", columnName: queryColumnName, insertData: queryColumnValue, success: success,
                           failure: failure)
    }
}
