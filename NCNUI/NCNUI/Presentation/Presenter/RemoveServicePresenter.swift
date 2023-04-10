//
//  RemoveServicePresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import NCN_BackEnd

class RemoveServicePresenter {
    weak var view: RemoveServiceViewContract?
    var removeService: RemoveService
    weak var router: RemoveServiceRouterContract?

    init(removeService: RemoveService) {
        self.removeService = removeService
    }
}

extension RemoveServicePresenter: RemoveServicePresenterContract {
    func viewLoaded(serviceId: Int) {
        let request = RemoveServiceRequest(serviceId: serviceId)
        removeService.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension RemoveServicePresenter {
    func result(message: String) {
        view?.load(message: message)
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
