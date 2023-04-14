//
//  CreateAvailableSubscriptionDatabase.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 14/04/23.
//

import Foundation
public class CreateAvaialableSubscriptionDatabaseService {
    public init() {}
    var db = Database.shared
}

extension CreateAvaialableSubscriptionDatabaseService : CreateAvailableSubscriptionDatabaseContract {
    public func createAvaialableSubscription(subscriptionId: Int, subscriptionPackageType: String, subscriptionConuntLimit: Float, subscriptionDaylimit: Int, serviceId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        let columnName = ["subscriptionId", "subscriptionPackageType", "subscriptionConuntLimit","subscriptionDaylimit", "serviceId", "enterpriseId"]
        let columnValue: [Any] = [subscriptionId, subscriptionPackageType, subscriptionConuntLimit, subscriptionDaylimit,serviceId, 11]
        db.insertStatement(tableName: "availableService", columnName: columnName, insertData: columnValue, success: {
            message in  () },
                           failure: failure)
        
        var result = db.selectQuery(columnString: "*", tableName: "availableService",whereClause: "serviceId =  last_insert_rowid()")
        print("executed here")
        var res: [AvailableService] = []
        guard let resultedArray = result else {
            failure("No Data")
            return
        }
        for dict in resultedArray {
            if let subscriptionId = dict["serviceId"] as? Int {
                
                if let subscriptionPackageType = dict["serviceTitle"] as? String {
                    
                    if let subscriptionCountLimit = dict["serviceDescription"] as? String {
                        
                        
                        
                        let newAvailableSubscription = AvailableService(serviceId: subscriptionId, serviceTitle: subscriptionPackageType , serviceDescription: subscriptionCountLimit)
                        
                        res.append(newAvailableSubscription)
                        
                        
                        
                    }
                    
                }
                
            }
            
            
        }
        if res.count == 0 {
            failure("No Data")
        } else {
            success("Data has been entered successfully")
        }
    }
    
    
}
