//
//  ViewAdminClientPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 30/03/23.
//

import Foundation
import NCN_BackEnd
class ViewAdminClientPresenter {
    weak var view: ViewAdminClientViewContract?
    var viewAdminClient: ViewAdminClient
    weak var router: ViewAdminClientRouterContract?

    init(viewAdminClient: ViewAdminClient) {
        self.viewAdminClient = viewAdminClient
    }
}

extension ViewAdminClientPresenter: ViewAdminClientPresenterContract {
    func viewLoaded(employeeId: Int) {
        let request = ViewAdminClientRequest(employeeId: employeeId)
        viewAdminClient.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension ViewAdminClientPresenter {
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
