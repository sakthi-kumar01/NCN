//
//  ModifyUserDetailsPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import NCN_BackEnd

class ModifyStringDetailsPresenter {
    weak var view: ModifyStringDetailsViewContract?
    var modifyStringDetails: ModifyStringDetails
    weak var router: ModifyStringDetailsRouterContract?

    init(modifyStringDetails: ModifyStringDetails) {
        self.modifyStringDetails = modifyStringDetails
    }
}

extension ModifyStringDetailsPresenter: ModifyStringDetailsPresenterContract {
    func viewLoaded(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int) {
        let request = ModifyStringDetailsRequest(userId: userId, userName: userName, password: password, eMail: eMail, mobileNo: mobileNo)
        modifyStringDetails.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension ModifyStringDetailsPresenter {
    func result(message: String) {
        view?.load(message: message)
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
