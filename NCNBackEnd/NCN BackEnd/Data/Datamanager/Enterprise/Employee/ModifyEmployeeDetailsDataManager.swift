//
//  ModifyEmployeeDetailsDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation

public class ModifyEmployeeDetailsDataManager {
    public var databaseService: ModifyEmployeeDetailsDatabaseServiceContract

    public init(databaseService: ModifyEmployeeDetailsDatabaseServiceContract) {
        self.databaseService = databaseService
    }

    private func success(response: String, callback: (String) -> Void) {
        callback(response)
    }

    private func failure(response: String, callback: (String) -> Void) {
        if response == "No avaialable service is found " {
            let error = "Sevice with this service id Doesn't exist"
            callback(error)
        }
    }
}

extension ModifyEmployeeDetailsDataManager: ModifyEmployeeDetailsDataContract {
    public func modifyEmployeeDetails(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.modifyEmployeeDetails(userId: userId, userName: userName, password: password, eMail: eMail, mobileNo: mobileNo,success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
        
    }
    
}
