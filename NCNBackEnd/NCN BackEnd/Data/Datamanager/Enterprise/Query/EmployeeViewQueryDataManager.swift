//
//  ViewEmployeeQueryDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation

public class ViewEmployeeQueryDataManager {
    public var databaseService: ViewEmployeeQueryDatabaseContract

    public init(databaseService: ViewEmployeeQueryDatabaseContract) {
        self.databaseService = databaseService
    }

    private func success(message: [Query], callback: ([Query]) -> Void) {
        callback(message)
    }

    private func failure(message: String, callback: (String) -> Void) {
        if message == "No avaialable service is found " {
            let error = "Sevice with this service id Doesn't exist"
            callback(error)
        }
    }
}

extension ViewEmployeeQueryDataManager: ViewEmployeeQueryDataContract {
    public func ViewEmployeeQuery(employeeId: Int, success: @escaping ([Query]) -> Void, failure: @escaping (String) -> Void) {
        databaseService.ViewEmployeeQuery(employeeId: employeeId, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
        
    }
    
}
