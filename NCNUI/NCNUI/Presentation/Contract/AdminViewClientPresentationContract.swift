//
//  AdminViewClientPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 30/03/23.
//

import Foundation
protocol AdminViewClientViewContract: AnyObject {
    func load(message: String)
}

protocol AdminViewClientPresenterContract {
    func viewLoaded(employeeId: Int)
}

protocol AdminViewClientRouterContract: AnyObject {
    func selected(message: String)
}
