//
//  ModifyUserDetailsPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import NCN_BackEnd

class ModifyUserDetailsPresenter {
    weak var view: ModifyUserDetailsViewContract?
    var modifyUserDetails: ModifyUserDetails
    weak var router: ModifyUserDetailsRouterContract?

    init(modifyUserDetails: ModifyUserDetails) {
        self.modifyUserDetails = modifyUserDetails
    }
}

extension ModifyUserDetailsPresenter: ModifyUserDetailsPresenterContract {
    func viewLoaded(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int) {
        let request = ModifyUserDetailsRequest(userId: userId, userName: userName, password: password, eMail: eMail, mobileNo: mobileNo)
        modifyUserDetails.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension ModifyUserDetailsPresenter {
    func result(response: String) {
        view?.load(response: response)
    }

    func failed(loginError: String) {
        view?.load(response: loginError)
    }
}
