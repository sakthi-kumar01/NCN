//
//  RemoveEmployeePresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import NCN_BackEnd

class RemoveEmployeePresenter {
    weak var view: RemoveEmployeeViewContract?
    var removeEmployee: RemoveEmployee
    weak var router: RemoveEmployeeRouterContract?

    init(removeEmployee: RemoveEmployee) {
        self.removeEmployee = removeEmployee
    }
}

extension RemoveEmployeePresenter: RemoveEmployeePresenterContract {
    func viewLoaded(employeeId: Int, userId: Int) {
        let request = RemoveEmployeeRequest(employeeId: employeeId, userId: userId)
        removeEmployee.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension RemoveEmployeePresenter {
    func result(response: String) {
        view?.load(response: response)
    }

    func failed(loginError: String) {
        view?.load(response: loginError)
    }
}
