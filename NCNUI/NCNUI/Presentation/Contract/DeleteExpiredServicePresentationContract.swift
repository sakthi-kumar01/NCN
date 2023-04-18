//
//  DeleteExpiredServicePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
protocol DeleteExpiredServiceViewContract: AnyObject {
    func load(message: String)
}

protocol DeleteExpiredServicePresenterContract {
    func viewLoaded()
}

protocol DeleteExpiredServiceRouterContract: AnyObject {
    func selected(message: String)
}
