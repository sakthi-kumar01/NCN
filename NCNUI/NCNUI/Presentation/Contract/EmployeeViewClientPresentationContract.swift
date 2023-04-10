//
//  EmployeeViewClientPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
protocol EmployeeViewClientViewContract: AnyObject {
    func load(message: String)
}

protocol EmployeeViewClientPresenterContract {
    func viewLoaded(employeeId: Int)
}

protocol EmployeeViewClientRouterContract: AnyObject {
    func selected(message: String)
}
