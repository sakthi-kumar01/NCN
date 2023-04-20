//
//  ViewSubscriptionPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 27/03/23.
//

import Foundation
import NCN_BackEnd
public class ViewSubscriptionPresenter {
    weak var view: ViewSubscriptionViewContract?
    var viewSubscription: ViewSubscription
    weak var router: ViewSubscriptionRouterContract?
    init(viewSubscription: ViewSubscription) {
        self.viewSubscription = viewSubscription
    }
}

extension ViewSubscriptionPresenter: ViewSubscriptionPresenterContract {
    func viewLoaded() {
        let request = ViewSubscriptionRequest()
        viewSubscription.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response)
        }, onFailure: { [weak self] loginError in
            self?.failed(error: loginError)
        })
    }
}

extension ViewSubscriptionPresenter {
    func result(response: ViewSubscriptionResponse) {
        for vals in response.response {
            view?.load(subscriptionId: vals.subscriptionId, subscriptionPackageType: vals.subscriptionPackageType, subscriptionCountLimit: vals.subscriptionCountLimit, subscritptionDayLimit: vals.subscritptionDayLimit, serviceId: vals.serviceId)
        }
    }

    func failed(error: ViewSubscriptionError) {
        view?.failed(error: error.error)
    }
}
