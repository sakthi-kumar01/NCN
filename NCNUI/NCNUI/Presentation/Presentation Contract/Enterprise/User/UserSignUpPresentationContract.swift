//
//  UserSignUpPresentationcontract.swift
//  NCNUI
//
//  Created by raja-16327 on 20/04/23.
//

import Foundation
protocol UserSignUpViewContract: AnyObject {
    func load(response: String)
}

protocol UserSignUpPresenterContract {
    func viewLoaded(userName: String, password: String, email: String, mobileNumber: Int)
}

protocol UserSignUpRouterContract: AnyObject {
    func selected(response: String)
}
