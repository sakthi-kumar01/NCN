//
//  EmployeeViewClientPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import NCN_BackEnd
class EmployeeViewClientPresenter {
    weak var view: EmployeeViewClientViewContract?
    var employeeViewClient: EmployeeViewClient
    weak var router: EmployeeViewClientRouterContract?

    init(employeeViewClient: EmployeeViewClient) {
        self.employeeViewClient = employeeViewClient
    }
}

extension EmployeeViewClientPresenter: EmployeeViewClientPresenterContract {
    func viewLoaded(employeeId: Int) {
        let request = EmployeeViewClientRequest(employeeId: employeeId)
        employeeViewClient.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension EmployeeViewClientPresenter {
    func result(message: [User]) {
        for user in message {
            view?.load(message: user.userName)
            view?.load(message: user.password)
            view?.load(message: user.email)
            view?.load(message: user.mobileNumber.description)
            view?.load(message: "")
        }
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
