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
    public func assignQuery(employeeId: Int, queryId: Int, success: @escaping (String) -> Void, failure : @escaping (String) -> Void) {
        var tableName = "query"
        var columnsValue = [ queryId, employeeId]
        var columnName = ["queryId","employeeId"]
        var rowIdColumnName = "queryId"
        var rowIdColumnValue = queryId
        db.updateValue(tableName: tableName, columnValue: columnsValue, columnName: columnName, rowIdColumnName: rowIdColumnName, rowIdValue: rowIdColumnValue, success: success, failure: failure)
    }
}
