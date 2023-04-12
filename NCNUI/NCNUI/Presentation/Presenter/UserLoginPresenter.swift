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
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension UserLoginPresenter {
    func result(message: String) {
        view?.load(message: message)
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
    
    
}
extension UserLoginPresenter {
    

    
}
