//
//  GetEnterpriseDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/04/23.
//

import Foundation
public class GetEnterpriseNameDataManager {
    public var databaseService: GetEnterpriseNameDatabaseServiceContract

    public init(databaseService: GetEnterpriseNameDatabaseServiceContract) {
        self.databaseService = databaseService
    }

    private func success(response: Enterprise, callback: (Enterprise) -> Void) {
        callback(response)
    }

    private func failure(response: String, callback: (String) -> Void) {
        if response == "No avaialable service is found " {
            let error = "Sevice with this service id Doesn't exist"
            callback(error)
        }
    }
}

extension GetEnterpriseNameDataManager: GetEnterpriseNameDatabaseServiceContract {
    public func getEnterpriseName( success: @escaping (Enterprise) -> Void, failure: @escaping (String) -> Void) {
        databaseService.getEnterpriseName( success: {
            [weak self] response in
            self?.success(response: response, callback: success)
        }, failure: {
            [weak self] response in
            self?.failure(response: response, callback: failure)
        })
        
    }
    
}
