//
//  AddNewUserPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 24/03/23.
//

import Foundation
protocol AddNewUserViewContract: AnyObject {
    func load(response: String)
    func failed(error: String)
}

protocol AddNewUserPresenterContract {
    func viewLoaded()
}

protocol AddNewUserRouterContract: AnyObject {
    func selected(response: String)
}
