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
    func viewLoaded() {
        let request = DeleteExpiredServiceRequest()
        deleteExpiredService.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension DeleteExpiredServicePresenter {
    func result(response: String) {
        view?.load(response: response)
    }

    func failed(loginError: String) {
        view?.load(response: loginError)
    }
}
