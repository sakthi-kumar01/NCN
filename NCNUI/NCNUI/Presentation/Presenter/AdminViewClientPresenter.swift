//
//  AdminViewClientPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 30/03/23.
//

import Foundation
import NCN_BackEnd
class AdminViewClientPresenter {
    weak var view: AdminViewClientViewContract?
    var adminViewClient: AdminViewClient
    weak var router: AdminViewClientRouterContract?

    init(adminViewClient: AdminViewClient) {
        self.adminViewClient = adminViewClient
    }
}

extension AdminViewClientPresenter: AdminViewClientPresenterContract {
    func viewLoaded(employeeId: Int) {
        let request = AdminViewClientRequest(employeeId: employeeId)
        adminViewClient.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension AdminViewClientPresenter {
    func result(message: [User]) {
        for user in message {
            view?.load(message: "")
            view?.load(message: "Username: " + user.userName)
            view?.load(message: "Password: " + user.password)
            view?.load(message: "EMail: " + user.email)
            view?.load(message: "Mobile Number: " + user.mobileNumber.description)
            view?.load(message: "")
        }
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
