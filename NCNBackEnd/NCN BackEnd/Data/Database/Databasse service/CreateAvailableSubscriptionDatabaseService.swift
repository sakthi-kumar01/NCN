//
//  CreateAvailableSubscriptionDatabaseService.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 27/03/23.
//

import Foundation
public class CreateAvailableSubscriptionDatabaseService: CreateAvailableSubscriptionDatabaseContract {
    public init() {}

    var db = Database.shared

    public func createAvaialableSubscription(subscriptionId: Int, subscriptionPackageType: String, subscriptionConuntLimit: Float, subscriptionDaylimit: Int, serviceId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        let availableSubscriptionColumnName = ["subscriptionId", "subscriptionPackageType", "subscriptionCountLimit", "subscritptionDayLimit", "serviceId"]
        let availableSubscriptionColumndata: [Any] = [subscriptionId, subscriptionPackageType, subscriptionConuntLimit, subscriptionDaylimit, serviceId]
        db.insertStatement(tableName: "availableSubscription", columnName: availableSubscriptionColumnName, insertData: availableSubscriptionColumndata, response: success, error: failure)
    }
}
