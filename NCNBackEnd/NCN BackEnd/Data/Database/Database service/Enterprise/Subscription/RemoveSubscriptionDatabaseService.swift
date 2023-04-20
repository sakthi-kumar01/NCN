//
//  RemoveSubscriptionDatabaseService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 14/04/23.
//

import Foundation
public class RemoveSubscriptionDatabaseService {
    public init() {}
    var db = Database.shared
}

extension RemoveSubscriptionDatabaseService : RemoveSubscriptionDatabaseServiceContract {
    public func removeSubscription(subscriptionId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        db.deleteValue(tableName: "availableSubscription", columnName: "subscriptionId", columnValue: String(describing: subscriptionId),success: success, failure: failure)
    }
    
    
}
