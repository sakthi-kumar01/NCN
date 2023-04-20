//
//  ViewAdminClientPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 30/03/23.
//

import Foundation
protocol ViewAdminClientViewContract: AnyObject {
    func load(message: String)
}

protocol ViewAdminClientPresenterContract {
    func viewLoaded(employeeId: Int)
}

protocol ViewAdminClientRouterContract: AnyObject {
    func selected(message: String)
}
