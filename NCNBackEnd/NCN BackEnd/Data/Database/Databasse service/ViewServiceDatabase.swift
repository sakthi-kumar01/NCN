//
//  ViewServiceDatabase.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 23/03/23.
//

import Foundation
public class ViewServiceDatabase: ViewServiceDatabaseContract {
    public init() {print("db created")}
    let db = Database.shared
    var result: [AvailableService] = []
    let returnServicesOne = AvailableService(serviceId: 1, serviceTitle: "random", serviceDescription: "random")
    let returnServicesTwo = AvailableService(serviceId: 2, serviceTitle: "random", serviceDescription: "random")
    var returnService: [AvailableService] = []
    
    public func viewService(success: @escaping ([AvailableService]) -> Void, failure : @escaping (String) -> Void) {
        var res = db.selectQuery(columnString: "*", tableName: "avaialableService")
        
        guard let resultedArray = res else {
            failure("No  data")
            return
        }
        for dict in resultedArray {
            if let subscriptionId = dict["serviceId"] as? Int, let subscriptionPackageType = dict["serviceTitle"] as? String, let subscriptionCountLimit = dict["serviceDescription"] as? String, let serviceId = dict["subscriptionId"] {
                var newAvailableSubscription = AvailableService(serviceId: subscriptionId, serviceTitle: subscriptionPackageType , serviceDescription: subscriptionCountLimit)
                print(newAvailableSubscription)
                result.append(newAvailableSubscription)
                
            }
            
            
            success(result)
        }
    }
}
