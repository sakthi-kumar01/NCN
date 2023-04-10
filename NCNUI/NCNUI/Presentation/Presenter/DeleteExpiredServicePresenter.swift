//
//  DeleteExpiredServicePresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import NCN_BackEnd

class DeleteExpiredServicePresenter {
    weak var view: DeleteExpiredServiceViewContract?
    var deleteExpiredService: DeleteExpiredService
    weak var router: DeleteExpiredServiceRouterContract?

    init(deleteExpiredService: DeleteExpiredService) {
        self.deleteExpiredService = deleteExpiredService
    }
}

extension DeleteExpiredServicePresenter: DeleteExpiredServicePresenterContract {
    func viewLoaded(serviceId: Int) {
        let request = DeleteExpiredServiceRequest(serviceId: serviceId)
        deleteExpiredService.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension DeleteExpiredServicePresenter {
    func result(message: String) {
        view?.load(message: message)
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
