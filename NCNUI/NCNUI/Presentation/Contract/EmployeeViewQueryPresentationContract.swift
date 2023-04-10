//
//  EmployeeViewQueryPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation


protocol EmployeeViewQueryViewContract: AnyObject {
    func load(message: String)
}

protocol EmployeeViewQueryPresenterContract {
    func viewLoaded(employeeId: Int)
}

protocol EmployeeViewQueryRouterContract: AnyObject {
    func selected(message: String)
}
