//
//  ViewExpiredServicePresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
import NCN_BackEnd
class ViewExpiredServicePresenter {
    weak var view: ViewExpiredServiceViewContract?
    var viewExpiredService: ViewExpiredService
    weak var router: ViewExpiredServiceRouterContract?

    init(viewExpiredService: ViewExpiredService) {
        self.viewExpiredService = viewExpiredService
    }
}

extension ViewExpiredServicePresenter: ViewExpiredServicePresenterContract {
    func viewLoaded() {
        let request = ViewExpiredServiceRequest()
        viewExpiredService.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension ViewExpiredServicePresenter {
    func result(message: [[String]]) {
        for value in message{
            
            view?.load(response: value[0])
            view?.load(response: value[1])
            view?.load(response: value[2])
            view?.load(response: value[3])
        }
    }

    func failed(loginError: String) {
        view?.load(response: loginError)
    }
}
