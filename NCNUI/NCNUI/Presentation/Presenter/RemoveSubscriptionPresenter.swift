//
//  RemoveSubscriptionPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 12/04/23.
//

import Foundation
import NCN_BackEnd

class RemoveSubscriptionPresenter {
    weak var view: RemoveSubscriptionViewContract?
    var removeSubscription: RemoveSubscription
    weak var router: RemoveSubscriptionRouterContract?

    init(removeSubscription: RemoveSubscription) {
        self.removeSubscription = removeSubscription
    }
}

extension RemoveSubscriptionPresenter: RemoveSubscriptionPresenterContract {
    func viewLoaded(subscriptionId: Int) {
        let request = RemoveSubscriptionRequest(subscriptionId: subscriptionId)
        removeSubscription.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension RemoveSubscriptionPresenter {
    func result(message: String) {
        view?.load(message: message)
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
