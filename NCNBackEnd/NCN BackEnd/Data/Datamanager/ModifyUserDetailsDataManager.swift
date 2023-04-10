//
//  ModifyUserDetailsDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
public class ModifyStringDetailsDataManager {
    public var databaseService: ModifyStringDetailsDatabaseContract

    public init(databaseService: ModifyStringDetailsDatabaseContract) {
        self.databaseService = databaseService
    }

    private func success(message: String, callback: (String) -> Void) {
        callback(message)
    }

    private func failure(message: String, callback: (String) -> Void) {
        if message == "No avaialable service is found " {
            let error = "Sevice with this service id Doesn't exist"
            callback(error)
        }
    }
}

extension ModifyStringDetailsDataManager: ModifyStringDetailsDataContract {
    
    
    public func modifyStringDetails(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void){
        databaseService.modifyStringDetails(userId: userId, userName: userName, password: password, eMail: eMail, mobileNo: mobileNo,  success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
        
    }
    
}
