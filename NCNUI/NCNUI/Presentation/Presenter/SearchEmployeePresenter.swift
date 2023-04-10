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
            view?.load(message: user.userName)
            view?.load(message: user.password)
            view?.load(message: user.email)
            view?.load(message: user.mobileNumber.description)
        }
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
