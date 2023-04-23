//
//  ViewEmployeeQueryPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation

protocol ViewEmployeeQueryViewContract: AnyObject {
    func load(response: String)
}

protocol ViewEmployeeQueryPresenterContract {
    func viewLoaded(employeeId: Int)
}

protocol ViewEmployeeQueryRouterContract: AnyObject {
    func selected(response: String)
}
