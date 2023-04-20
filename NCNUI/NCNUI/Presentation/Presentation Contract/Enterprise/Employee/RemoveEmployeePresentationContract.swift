//
//  RemoveEmployeePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation

protocol RemoveEmployeeViewContract: AnyObject {
    func load(response: String)
}

protocol RemoveEmployeePresenterContract {
    func viewLoaded(employeeId: Int, userId: Int)
}

protocol RemoveEmployeeRouterContract: AnyObject {
    func selected(response: String)
}
