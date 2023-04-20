//
//  DeleteExpiredServicePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
protocol DeleteExpiredServiceViewContract: AnyObject {
    func load(response: String)
}

protocol DeleteExpiredServicePresenterContract {
    func viewLoaded()
}

protocol DeleteExpiredServiceRouterContract: AnyObject {
    func selected(response: String)
}
