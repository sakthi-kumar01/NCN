//
//  AssignQueryDatabaseService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 08/04/23.
//

import Foundation
public class AssignQueryDatabaseService {
    var db: Database = .shared

    public init() {}
}

extension AssignQueryDatabaseService: AssignQueryDatabaseContract {
    public func assignQuery(employeeId: Int, queryId: Int, success _: @escaping (String) -> Void, failure _: @escaping (String) -> Void) {
        var tableName = "query"
        var columns = ["queryId": queryId, "employeeId": employeeId]
        var rowIdColumnName = "queryId"
        var rowIdColumnValue = queryId
        db.prepareUpdateStatement(tableName: tableName, columns: columns, rowIdColumnName: rowIdColumnName, rowIdValue: rowIdColumnValue)
    }
}
