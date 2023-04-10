//
//  ModifyUserDetailsPresentationcontract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
protocol ModifyStringDetailsViewContract: AnyObject {
    func load(message: String)
}

protocol ModifyStringDetailsPresenterContract {
    func viewLoaded(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int)
}

protocol ModifyStringDetailsRouterContract: AnyObject {
    func selected(message: String)
}
