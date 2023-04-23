//
//  ViewEmployeeClientPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import NCN_BackEnd
class ViewEmployeeClientPresenter {
    weak var view: ViewEmployeeClientViewContract?
    var viewEmployeeClient: ViewEmployeeClient
    weak var router: ViewEmployeeClientRouterContract?

    init(ViewEmployeeClient: ViewEmployeeClient) {
        viewEmployeeClient = ViewEmployeeClient
    }
}

extension ViewEmployeeClientPresenter: ViewEmployeeClientPresenterContract {
    func viewLoaded(employeeId: Int) {
        let request = ViewEmployeeClientRequest(employeeId: employeeId)
        viewEmployeeClient.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension ViewEmployeeClientPresenter {
    func result(message: [User]) {
        for user in message {
            view?.load(response: user.userName)
            view?.load(response: user.password)
            view?.load(response: user.email)
            view?.load(response: user.mobileNumber.description)
            view?.load(response: "")
        }
    }

    func failed(loginError: String) {
        view?.load(response: loginError)
    }
}
