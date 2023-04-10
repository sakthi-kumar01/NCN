//
//  RemoveServicePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation

protocol RemoveServiceViewContract: AnyObject {
    func load(message: String)
}

protocol RemoveServicePresenterContract {
    func viewLoaded(serviceId: Int)
}

protocol RemoveServiceRouterContract: AnyObject {
    func selected(message: String)
}
