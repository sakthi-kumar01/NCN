//
//  UserSignUpPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 20/04/23.
//

import Foundation
import NCN_BackEnd
class UserSignUpPresenter {
    weak var view: UserSignUpViewContract?
    var userSignUp: UserSignUp
    weak var router: UserSignUpRouterContract?

    init(userSignUp: UserSignUp) {
        self.userSignUp = userSignUp
    }
}

extension UserSignUpPresenter: UserSignUpPresenterContract {
    func viewLoaded(userName: String, password: String, email: String, mobileNumber: Int) {
        let request = UserSignUpRequest(userName: userName, password: password, email: email, mobileNumber: mobileNumber)
        userSignUp.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension UserSignUpPresenter {
    func result(response: String) {
        view?.load(response: response)
    }

    func failed(loginError: String) {
        view?.load(response: loginError)
    }
}
