//
//  AssignQueryPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 08/04/23.
//

import Foundation
import NCN_BackEnd

class AssignQueryPresenter {
    weak var view: AssignQueryViewContract?
    var assignQuery: AssignQuery
    weak var router: AssignQueryRouterContract?

    init(assignQuery: AssignQuery) {
        self.assignQuery = assignQuery
    }
}

extension AssignQueryPresenter: AssignQueryPresenterContract {
    func viewLoaded(employeeId: Int, queryId: Int) {
        let request = AssignQueryRequest(employeeId: employeeId, queryId: queryId)
        assignQuery.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension AssignQueryPresenter {
    func result(message: String) {
        view?.load(message: message)
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
