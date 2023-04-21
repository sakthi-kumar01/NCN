//
//  UserSignUpDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/04/23.
//

import Foundation

public class UserSignUpDataManager {
    public var databaseService: UserSignUpDatabaseServiceContract

    public init(databaseService: UserSignUpDatabaseServiceContract) {
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

extension UserSignUpDataManager: UserSignUpDataContract {
    public func userSignUp(userName: String, password: String, email: String, mobileNumber: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.userSignUp(userName: userName, password: password, email: email, mobileNumber: mobileNumber, success: {
            [weak self] response in
            self?.success(response: response, callback: success)
        }, failure: {
            [weak self] response in
            self?.failure(response: response, callback: failure)
        })
        
    }
    
}

