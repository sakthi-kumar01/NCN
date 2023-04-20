//
//  ViewEmployeeClientPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
protocol ViewEmployeeClientViewContract: AnyObject {
    func load(message: String)
}

protocol ViewEmployeeClientPresenterContract {
    func viewLoaded(employeeId: Int)
}

protocol ViewEmployeeClientRouterContract: AnyObject {
    func selected(message: String)
}
