//
//  AddNewUserPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 24/03/23.
//

import Foundation
import NCN_BackEnd

public class AddNewUserPresenter {
    weak var view: AddNewUserViewContract?
    var addUNewUser: AddNewUser
    weak var router: AddNewUserRouterContract?

    init(addUNewUser: AddNewUser) {
        self.addUNewUser = addUNewUser
    }
}

extension AddNewUserPresenter: AddNewUserPresenterContract {
    func viewLoaded() {
        let request = AddNewUserRequest(UserName: "raja", password: "sakthi", email: "raja@zohocorp.com", mobileNumber: 1_234_567_890, enterpriseId: 1)
        addUNewUser.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response)
        }, onFailure: { [weak self] loginError in
            self?.failed(error: loginError)
        })
    }
}

extension AddNewUserPresenter {
    func result(response: AddNewUserResponse) {
        view?.load(message: response.response)
    }

    func failed(error: AddNewUserError) {
        view?.failed(error: error.error)
    }
}
