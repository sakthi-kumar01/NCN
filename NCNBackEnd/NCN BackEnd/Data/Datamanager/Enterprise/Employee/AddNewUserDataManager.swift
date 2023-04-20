//
//  AddNewUserDataManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 17/03/23.
//

import Foundation
public class AddNewUserDataManager {
    public var dataBase: AddNewUserDatabaseServiceContract

    public init(dataBase: AddNewUserDatabaseServiceContract) {
        self.dataBase = dataBase
    }

    private func success(message: String, callback: (String) -> Void) {
        callback(message)
    }

    private func failure(message: String, callback: (String) -> Void) {
        if message == "No Data" {
            let error = "User already exist"
            callback(error)
        }
    }
}

extension AddNewUserDataManager: AddNewUserDataContract {
    public func addNewUser(userName: String, password: String, email: String, mobileNumber: Int64, enterpriseId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        dataBase.addNewUser(userName: userName, password: password, email: email, mobilePhone: mobileNumber, enterpriseId: enterpriseId, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        },
        failure: {
            [weak self] message in

            self?.failure(message: message, callback: failure)
        })
    }
}
