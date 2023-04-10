//
//  AddNewEmployeeDatamanger.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 24/03/23.
//

import Foundation
public class AddNewEmployeeDatamanger {
    var databaseService: AddNewEmployeeDatabaseContract

    public init(databaseService: AddNewEmployeeDatabaseContract) {
        self.databaseService = databaseService
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

extension AddNewEmployeeDatamanger: AddNewEmployeeDataContract {
    public func addNewEmployee(userName: String, password: String, email: String, mobileNumber: Int64, employeeType: Int, enterpriseId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.addEmployeeDetails(userName: userName, password: password, email: email, mobilePhone: mobileNumber, employeeType: employeeType, enterpriseId: enterpriseId, success: {
            [weak self] message in
            self?.success(message: message, callback: success)

        }, failure: {
            [weak self] message in
            self?.success(message: message, callback: failure)
        })
    }
}
