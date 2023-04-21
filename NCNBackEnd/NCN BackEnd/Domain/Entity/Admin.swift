//
//  Admin.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 14/03/23.
//

import Foundation
public class Admin: Employee {
    public var employees: [Employee]?
    public var queries: [Query]?
    public var services: [Service]?
    override public init(userName: String,
                         email: String, password: String, mobileNumber: Int, employeeId: Int, employeeType: EmploymentType, enterpriseId: Int)
    {
        super.init(userName: userName, email: email, password: password, mobileNumber: mobileNumber, employeeId: employeeId, employeeType: employeeType, enterpriseId: enterpriseId)
    }
}
