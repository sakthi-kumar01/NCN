//
//  CreateAvailabaleServicePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 21/03/23.
//

import Foundation
protocol CreateAvailableServiceViewContract: AnyObject {
    func load(serviceId: Int, serviceTitle: String, serviceDescription: String)
    func failed(error: String)
}

protocol CreateAvailableServicePresenterContract {
    func viewLoaded(serviceId: Int, serviceTitle: String, serviceDescription: String)
}

protocol CreateAvailableServiceRouterContract: AnyObject {
    func selected(message: String)
}
