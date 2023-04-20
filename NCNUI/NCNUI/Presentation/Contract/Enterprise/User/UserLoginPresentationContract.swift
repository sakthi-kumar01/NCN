//
//  UserLoginPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 13/03/23.
//

import Foundation

protocol UserLoginViewContract: AnyObject {
    func load(message: String)
}

protocol UserLoginPresenterContract {
    func viewLoaded(userName: String, password: String)
}

protocol UserLoginRouterContract: AnyObject {
    func selected(message: String)
}
