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

    private func success(response: [Employee], callback: ([Employee]) -> Void) {
        callback(response)
    }

    private func failure(response: String, callback: (String) -> Void) {
        if response == "No avaialable service is found " {
            let error = "Sevice with this service id Doesn't exist"
            callback(error)
        }
    }
}

extension SearchEmployeeDataManager: SearchEmployeeDataContract {
    public func searchEmployee(employeeId: Int, success: @escaping ([Employee]) -> Void, failure: @escaping (String) -> Void) {
        databaseService.searchEmployee(employeeId: employeeId, success: {
            [weak self] message in
            self?.success(response: message, callback: success)
        }, failure: {
            [weak self] message in
            self?.failure(response: message, callback: failure)
        })
    }
}
