//
//  CreateAvailableServicesPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 21/03/23.
//

import Foundation
import NCN_BackEnd
public class CreateAvailableServicesPresenter {
    weak var view: CreateAvailableServiceViewContract?
    var createAvailableService: CreateAvailableService
    weak var router: CreateAvailableServiceRouterContract?
    init(createAvailableService: CreateAvailableService) {
        self.createAvailableService = createAvailableService
    }
}

extension CreateAvailableServicesPresenter: CreateAvailableServicePresenterContract {
    func viewLoaded(serviceId: Int, serviceTitle: String, serviceDescription: String) {
        let request = CreateAvailableServiceRequest(serviceId: serviceId, serviceTitle: serviceTitle, serviceDescription: serviceDescription)
        createAvailableService.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response)
        }, onFailure: { [weak self] error in
            self?.failed(error: error)
        })
    }
}

extension CreateAvailableServicesPresenter {
    func result(response: CreateAvailableServiceResponse) {
        view?.load(serviceId: response.response.serviceId, serviceTitle: response.response.serviceTitle, serviceDescription: response.response.serviceDescription)
    }

    func failed(error: CreateAvailableServiceError) {
        view?.failed(error: error.error)
    }
}
