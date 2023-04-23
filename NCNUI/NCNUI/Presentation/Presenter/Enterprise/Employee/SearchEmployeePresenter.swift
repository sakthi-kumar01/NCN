//
//  SearchEmployeePresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import NCN_BackEnd
class SearchEmployeePresenter {
    weak var view: SearchEmployeeViewContract?
    var searchEmployee: SearchEmployee
    weak var router: SearchEmployeeRouterContract?

    init(searchEmployee: SearchEmployee) {
        self.searchEmployee = searchEmployee
    }
}

extension SearchEmployeePresenter: SearchEmployeePresenterContract {
    func viewLoaded(employeeId: Int) {
        let request = SearchEmployeeRequest(employeeId: employeeId)
        searchEmployee.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension SearchEmployeePresenter {
    func result(message: [Employee]) {
        for user in message {
            view?.load(response: "userName: " + user.userName)
            view?.load(response: "password: " + user.password)
            view?.load(response: "email: " + user.email)
            view?.load(response: "mobile number: " + user.mobileNumber.description)
            view?.load(response: "")
        }
    }

    func failed(loginError: String) {
        view?.load(response: loginError)
    }
}
