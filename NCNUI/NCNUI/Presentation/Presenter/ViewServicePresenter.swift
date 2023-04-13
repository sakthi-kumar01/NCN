//
//  ViewServicePresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 23/03/23.
//

import Foundation
import NCN_BackEnd
public class ViewServicePresenter {
    weak var view: ViewServiceViewContract?
    var viewService: ViewService
    weak var router: ViewServiceRouterContract?
    init(viewService: ViewService) {
        self.viewService = viewService
    }
}

extension ViewServicePresenter: ViewServicePresenterContract {
    func viewLoaded() {
        let request = ViewServiceRequest()
        viewService.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response)
        }, onFailure: { [weak self] loginError in
            self?.failed(error: loginError)
        })
    }
}

extension ViewServicePresenter {
    func result(response: ViewServiceResponse) {
       
        for vals in response.response {
           
            view?.load(serviceId: vals.serviceId, serviceTitle: vals.serviceTitle, serviceDescription: vals.serviceDescription)
        }
    }

    func failed(error: ViewServiceError) {
        view?.failed(error: error.error)
    }
}
