//
//  RemoveEmployeePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation

protocol RemoveEmployeeViewContract: AnyObject {
    func load(message: String)
}

protocol RemoveEmployeePresenterContract {
    func viewLoaded(employeeId: Int, userId: Int)
}

protocol RemoveEmployeeRouterContract: AnyObject {
    func selected(message: String)
}
