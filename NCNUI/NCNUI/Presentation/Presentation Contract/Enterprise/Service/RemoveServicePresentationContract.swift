//
//  RemoveAvailableServicePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation

protocol RemoveAvailableServiceViewContract: AnyObject {
    func load(response: String)
}

protocol RemoveAvailableServicePresenterContract {
    func viewLoaded(serviceId: Int)
}

protocol RemoveAvailableServiceRouterContract: AnyObject {
    func selected(response: String)
}
