//
//  ModifyavaialableServicePresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
import NCN_BackEnd

class ModifyAvailableServicePresenter {
    weak var view: ModifyAvailableServiceViewContract?
    var modifyAvailableService: ModifyAvailableService
    weak var router: ModifyAvailableServiceRouterContract?

    init(modifyAvailableService: ModifyAvailableService) {
        self.modifyAvailableService = modifyAvailableService
    }
}

extension ModifyAvailableServicePresenter: ModifyAvailableServicePresenterContract {
    func viewLoaded(serviceId: Int, serviceTitle: String, serviceDescription: String) {
        let request = ModifyAvailableServiceRequest(serviceId: serviceId, serviceTitle: serviceTitle, serviceDescription: serviceDescription)
        modifyAvailableService.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension ModifyAvailableServicePresenter {
    func result(message: String) {
        view?.load(message: message)
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
