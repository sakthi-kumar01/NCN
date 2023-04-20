//
//  ModifyEmployeeDetailsPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
protocol ModifyEmployeeDetailsViewContract: AnyObject {
    func load(response: String)
}

protocol ModifyEmployeeDetailsPresenterContract {
    func viewLoaded(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int)
}

protocol ModifyEmployeeDetailsRouterContract: AnyObject {
    func selected(response: String)
}
