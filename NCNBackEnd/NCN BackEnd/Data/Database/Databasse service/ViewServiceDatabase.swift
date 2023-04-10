//
//  ViewServiceDatabase.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 23/03/23.
//

import Foundation
public class ViewServiceDatabase: ViewServiceDatabaseContract {
    public init() {}
    let db = Database.shared

    let returnServicesOne = AvailableService(serviceId: 1, serviceTitle: "random", serviceDescription: "random")
    let returnServicesTwo = AvailableService(serviceId: 2, serviceTitle: "random", serviceDescription: "random")
    var returnService: [AvailableService] = []

    public func viewService(success: @escaping ([AvailableService]) -> Void, failure _: @escaping (String) -> Void) {
        returnService.append(returnServicesOne)
        returnService.append(returnServicesTwo)
        success(returnService)
    }
}
