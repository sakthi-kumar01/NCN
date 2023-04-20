//
//  CreateAvaialableSubscriptionPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 27/03/23.
//

import Foundation
import NCN_BackEnd
public class CreateAvailableSubscriptionPresenter {
    weak var view: CreateAvailableSubscriptionViewContract?
    var createAvailableSubscription: CreateAvailableSubscription
    weak var router: CreateAvailableSubscriptionRouterContract?
    init(createAvailableSubscription: CreateAvailableSubscription) {
        self.createAvailableSubscription = createAvailableSubscription
    }
}

extension CreateAvailableSubscriptionPresenter: CreateAvailableSubscriptionPresenterContract {
    func viewLoaded(subscriptionId: Int, subscriptionPackageType: String, subscriptionConuntLimit: Float, subscriptionDaylimit: Int, serviceId: Int) {
        let request = CreateAvailableSubscriptionRequest(subscriptionId: subscriptionId, subscriptionPackageType: subscriptionPackageType, subscriptionConuntLimit: subscriptionConuntLimit, subscriptionDaylimit: subscriptionDaylimit, serviceId: serviceId)
        createAvailableSubscription.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response)
        }, onFailure: { [weak self] error in
            self?.failed(error: error)
        })
    }
}

extension CreateAvailableSubscriptionPresenter {
    func result(response: CreateAvailableSubscriptionResponse) {
        view?.load(message: response.response)
    }

    func failed(error: CreateAvailableSubscriptionError) {
        view?.failed(error: error.error)
    }
}
