//
//  Employee.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 17/03/23.
//

import Foundation
public class Employee: User {
    public var employeeId: Int?
    public var clients: [Client]?
    public var employeeType: EmploymentType
    public init(userName: String, email: String, password: String, mobileNumber: Int64, employeeId _: Int, employeeType: EmploymentType, enterpriseId: Int) {
        self.employeeType = employeeType
        super.init(userName: userName, email: email, password: password, mobileNumber: mobileNumber, enterpriseId: enterpriseId)
    }
}
