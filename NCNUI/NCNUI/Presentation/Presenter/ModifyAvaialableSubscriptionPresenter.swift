//
//  ModifyAvaialableSubscriptionPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
import NCN_BackEnd
class ModifyAvailableSubscriptionPresenter {
    weak var view: ModifyAvailableSubscriptionViewContract?
    var modifyAvailableSubscription: ModifyAvailableSubscription
    weak var router: ModifyAvailableSubscriptionRouterContract?

    init(modifyAvailableSubscription: ModifyAvailableSubscription) {
        self.modifyAvailableSubscription = modifyAvailableSubscription
    }
}

extension ModifyAvailableSubscriptionPresenter: ModifyAvailableSubscriptionPresenterContract {
    func viewLoaded(subscriptionId: Int, subscriptionPackageLimit: Float, subscriptionCountLimit: Float, subscriptionDayLimit: Int) {
        let request = ModifyAvailableSubscriptionRequest(subscriptionId: subscriptionId, subscriptionPackageLimit: subscriptionPackageLimit, subscriptionCountLimit: subscriptionCountLimit, subscriptionDayLimit: subscriptionDayLimit)
        modifyAvailableSubscription.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension ModifyAvailableSubscriptionPresenter {
    func result(message: String) {
        view?.load(message: message)
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
