//
//  BuyServicePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 29/03/23.
//

import Foundation
protocol BuyServiceViewContract: AnyObject {
    func load(message: String)
    func failed(error: String)
}

protocol BuyServicePresenterContract {
    func viewLoaded(userId: Int, employeeId: Int, serviceId: Int, subscriptionId: Int, enterpriseId: Int)
}

protocol BuyServiceRouterContract: AnyObject {
    func selected(message: String)
}
