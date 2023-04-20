//
//  SearchEmployeePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
protocol SearchEmployeeViewContract: AnyObject {
    func load(message: String)
}

protocol SearchEmployeePresenterContract {
    func viewLoaded(employeeId: Int)
}

protocol SearchEmployeeRouterContract: AnyObject {
    func selected(message: String)
}
