//
//  ModifyAvaialableSubscriptionPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
protocol ModifyAvailableSubscriptionViewContract: AnyObject {
    func load(response: String)
}

protocol ModifyAvailableSubscriptionPresenterContract {
    func viewLoaded(subscriptionId: Int, subscriptionPackageType: String, subscriptionCountLimit: Float, subscriptionDayLimit: Int)
}

protocol ModifyAvailableSubscriptionRouterContract: AnyObject {
    func selected(response: String)
}
