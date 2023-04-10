//
//  ViewServicePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 23/03/23.
//

import Foundation
protocol ViewServiceViewContract: AnyObject {
    func load(serviceId: Int, serviceTitle: String, serviceDescription: String)
    func failed(error: String)
}

protocol ViewServicePresenterContract {
    func viewLoaded()
}

protocol ViewServiceRouterContract: AnyObject {
    func selected(message: String)
}
