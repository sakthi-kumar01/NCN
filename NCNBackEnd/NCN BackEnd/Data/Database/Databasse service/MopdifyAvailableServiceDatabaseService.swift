//
//  MopdifyAvailableServiceDatabaseService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
public class ModifyAvailableServiceDatabaseService {
    var db = Database.shared

    public init() {}
}

// extension ModifyAvailableServiceDatabaseService : ModifyAvailableServiceDatabaseContract {
//    public func modifyAvailableService(serviceId: Int, serviceTitle: String, serviceDescription: String, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
//        db.prepareUpdateStatement(tableName: <#T##String#>, columns: <#T##[String : Any]#>, rowIdColumnName: <#T##String#>, rowIdValue: <#T##Int#>)
//    }
//
//
// }
