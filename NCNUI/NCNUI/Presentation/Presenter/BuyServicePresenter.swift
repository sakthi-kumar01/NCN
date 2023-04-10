//
//  BuyServicePresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 29/03/23.
//

import Foundation
import NCN_BackEnd

public class BuyServicePresenter {
    weak var view: BuyServiceViewContract?
    var buyService: BuyService
    weak var router: BuyServiceRouterContract?
    init(buyService: BuyService) {
        self.buyService = buyService
    }
}

extension BuyServicePresenter: BuyServicePresenterContract {
    func viewLoaded(userId: Int, employeeId: Int, serviceId: Int, subscriptionId: Int, enterpriseId: Int) {
        let request = BuyServiceRequest(userId: userId, employeeId: employeeId, serviceId: serviceId, subscriptionId: subscriptionId, enterpriseId: enterpriseId)
        buyService.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response)
        }, onFailure: { [weak self] error in
            self?.failed(error: error)
        })
    }
}

extension BuyServicePresenter {
    func result(response: BuyServiceResponse) {
        view?.load(message: response.response)
    }

    func failed(error: BuyServiceError) {
        view?.failed(error: error.error)
    }
}
