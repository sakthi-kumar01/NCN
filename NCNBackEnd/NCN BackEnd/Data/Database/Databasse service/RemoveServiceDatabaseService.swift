//
//  RemoveServiceDatabaseService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
public class RemoveServiceDatabaseService {
    public init() {}
     var db = Database.shared
}
extension RemoveServiceDatabaseService : RemoveServiceDatabaseContract {
    public func removeService(serviceId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        db.deleteValue(tableName: "availableService", columnName: "serviceId", columnValue: String(describing: serviceId),success: success, failure: failure)
    }
    
    
}
