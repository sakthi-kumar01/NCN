//
//  RemoveAvailableServicePresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import NCN_BackEnd

class RemoveAvailableServicePresenter {
    weak var view: RemoveAvailableServiceViewContract?
    var removeAvailableService: RemoveAvailableService
    weak var router: RemoveAvailableServiceRouterContract?

    init(removeAvailableService: RemoveAvailableService) {
        self.removeAvailableService = removeAvailableService
    }
}

extension RemoveAvailableServicePresenter: RemoveAvailableServicePresenterContract {
    func viewLoaded(serviceId: Int) {
        let request = RemoveAvailableServiceRequest(serviceId: serviceId)
        removeAvailableService.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension RemoveAvailableServicePresenter {
    func result(response: String) {
        view?.load(response: response)
    }

    func failed(loginError: String) {
        view?.load(response: loginError)
    }
}
