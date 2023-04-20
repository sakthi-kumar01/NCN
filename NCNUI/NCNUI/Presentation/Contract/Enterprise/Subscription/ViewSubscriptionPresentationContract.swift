//
//  ViewSubscriptionPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 27/03/23.
//

import Foundation
protocol ViewSubscriptionViewContract: AnyObject {
    func load(subscriptionId: Int, subscriptionPackageType: String?, subscriptionCountLimit: Int?, subscritptionDayLimit: Int?, serviceId: Int)
    func failed(error: String)
}

protocol ViewSubscriptionPresenterContract {
    func viewLoaded()
}

protocol ViewSubscriptionRouterContract: AnyObject {
    func selected(message: String)
}
