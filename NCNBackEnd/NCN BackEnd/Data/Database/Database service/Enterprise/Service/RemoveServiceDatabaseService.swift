//
//  RemoveAvailableServiceDatabaseService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
public class RemoveAvailableServiceDatabaseService {
    public init() {}
    var db = Database.shared
}

extension RemoveAvailableServiceDatabaseService: RemoveAvailableServiceDatabaseServiceContract {
    public func removeAvailableService(serviceId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        db.deleteValue(tableName: "availableService", columnName: "serviceId", columnValue: String(describing: serviceId), success: success, failure: failure)
    }
}
