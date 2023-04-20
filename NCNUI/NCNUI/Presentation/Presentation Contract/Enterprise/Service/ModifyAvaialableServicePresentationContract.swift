//
//  ModifyAvaialableServicePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
protocol ModifyAvailableServiceViewContract: AnyObject {
    func load(response: String)
}

protocol ModifyAvailableServicePresenterContract {
    func viewLoaded(serviceId: Int, serviceTitle: String, serviceDescription: String)
}

protocol ModifyAvailableServiceRouterContract: AnyObject {
    func selected(response: String)
}
