//
//  UserLoginPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 13/03/23.
//

import Foundation
import NCN_BackEnd
import Security
class UserLoginPresenter {
    weak var view: UserLoginViewContract?
    var userLogin: UserLogin
    weak var router: UserLoginRouterContract?

    init(userLogin: UserLogin) {
        self.userLogin = userLogin
    }
}

extension UserLoginPresenter: UserLoginPresenterContract {
    func viewLoaded(userName: String, password: String) {
        let request = UserLoginRequest(userName: userName, password: password)
        userLogin.execute(request: request, onSuccess: { [weak self] response in
            self?.result(user: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(error: loginError.error)
        })
    }
}

extension UserLoginPresenter {
    func result(user: User) {
        view?.load(response: user.userName)
    }

    func failed(error: String) {
        view?.load(response: error)
    }
}

extension UserLoginPresenter {}
