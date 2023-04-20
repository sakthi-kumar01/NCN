//
//  SearchEmployeeDatamanager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import VTComponents
public class SearchEmployeeDataManager {
    public var databaseService: SearchEmployeeDatabaseServiceContract

    public init(databaseService: SearchEmployeeDatabaseServiceContract) {
        self.databaseService = databaseService
    }

    private func success(message: [Employee], callback: ([Employee]) -> Void) {
        callback(message)
    }

    private func failure(message: String, callback: (String) -> Void) {
        if message == "No avaialable service is found " {
            let error = "Sevice with this service id Doesn't exist"
            callback(error)
        }
    }
}

extension SearchEmployeeDataManager: SearchEmployeeDataContract {
    public func searchEmployee(employeeId: Int, success: @escaping ([Employee]) -> Void, failure: @escaping (String) -> Void) {
        databaseService.searchEmployee(employeeId: employeeId, success: {
            [weak self] message in
            self?.success(message: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(message: message, callback: failure)
        })
    }
}
