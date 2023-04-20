//
//  AddNewEmployeeDatamanger.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 24/03/23.
//

import Foundation
public class AddNewEmployeeDatamanger {
    var databaseService: AddNewEmployeeDatabaseServiceContract

    public init(databaseService: AddNewEmployeeDatabaseServiceContract) {
        self.databaseService = databaseService
    }

    private func success(response: String, callback: (String) -> Void) {
        callback(response)
    }

    private func failure(response: String, callback: (String) -> Void) {
        if response == "No Data" {
            let error = "User already exist"
            callback(error)
        }
    }
}

extension AddNewEmployeeDatamanger: AddNewEmployeeDataContract {
    public func addNewEmployee(userName: String, password: String, email: String, mobileNumber: Int64, employeeType: Int, enterpriseId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        databaseService.addEmployeeDetails(userName: userName, password: password, email: email, mobilePhone: mobileNumber, employeeType: employeeType, enterpriseId: enterpriseId, success: {
            [weak self] message in
            self?.success(response: message, callback: success)

        }, failure: {
            [weak self] message in
            self?.success(response: message, callback: failure)
        })
    }
}
