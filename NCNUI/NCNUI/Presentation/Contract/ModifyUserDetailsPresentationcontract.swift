//
//  ModifyUserDetailsPresentationcontract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
protocol ModifyUserDetailsViewContract: AnyObject {
    func load(message: String)
}

protocol ModifyUserDetailsPresenterContract {
    func viewLoaded(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int)
}

protocol ModifyUserDetailsRouterContract: AnyObject {
    func selected(message: String)
}
