//
//  EmployeeViewDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 30/03/23.
//

import Foundation
public protocol ViewEmployeeClientDataContract {
    func ViewEmployeeClient(employeeId: Int, success: @escaping ([User]) -> Void, failure: @escaping (String) -> Void)
}
