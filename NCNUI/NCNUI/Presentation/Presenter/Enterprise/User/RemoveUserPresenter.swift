//
//  RemoveUserPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import NCN_BackEnd
class RemoveUserPresenter {
    weak var view: RemoveUserViewContract?
    var removeUser: RemoveUser
    weak var router: RemoveUserRouterContract?

    init(removeUser: RemoveUser) {
        self.removeUser = removeUser
    }
}

extension RemoveUserPresenter: RemoveUserPresenterContract {
    func viewLoaded(userId: Int) {
        let request = RemoveUserRequest(userId: userId)
        removeUser.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension RemoveUserPresenter {
    func result(response: String) {
        view?.load(response: response)
    }

    func failed(loginError: String) {
        view?.load(response: loginError)
    }
}
