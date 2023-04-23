//
//  AssignQueryStatusDatabaseService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 17/04/23.
//

import Foundation
public class AssignQueryStatusDatabaseService {
    public init() {}

    var db = Database.shared
}

extension AssignQueryStatusDatabaseService: AssignQueryStatusDatabaseServiceContract {
    public func assignQueryStatus(queryId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        let rowIdColumnName = "queryId"
        let rowIdColumnValue = queryId

        "\(rowIdColumnName) = \(rowIdColumnValue)"
        db.updateValue(tableName: "query", columnValue: ["false"], columnName: ["queryStatus"], whereClause: "\(rowIdColumnName) = \(rowIdColumnValue)", success: success, failure: failure)
    }
}
