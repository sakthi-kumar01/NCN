//
//  CreateAvaialableSubscriptionPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 27/03/23.
//

import Foundation
protocol CreateAvailableSubscriptionViewContract: AnyObject {
    func load(response: String)
    func failed(error: String)
}

protocol CreateAvailableSubscriptionPresenterContract {
    func viewLoaded(subscriptionId: Int, subscriptionPackageType: String, subscriptionConuntLimit: Float, subscriptionDaylimit: Int, serviceId: Int)
}

protocol CreateAvailableSubscriptionRouterContract: AnyObject {
    func selected(response: String)
}
