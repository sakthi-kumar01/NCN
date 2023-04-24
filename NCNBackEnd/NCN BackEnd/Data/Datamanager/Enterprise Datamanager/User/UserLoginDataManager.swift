//
//  UserLoginDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 13/03/23.
//

import Foundation
public final class UserLoginDataManager {
    public var dataBase: UserLoginDatabaseServiceContract

    public init(dataBase: UserLoginDatabaseServiceContract) {
        self.dataBase = dataBase
    }

    private func success(response: User, callback: (User) -> Void) {
        callback(response)
    }

    private func failure(response: String, callback: (String) -> Void) {
        if response == "No Data" {
            let error = "User doesn't exist"
            callback(error)
        }
    }
}

extension UserLoginDataManager: UserLoginDataContract {
    public func userLogin(userName: String, password: String, success: @escaping (User) -> Void, failure: @escaping (String) -> Void) {
        dataBase.userLogin(userName: userName, password: password, success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        },
        failure: {
            [weak self] message in

            self?.failure(response: message, callback: failure)
        })
    }
}
