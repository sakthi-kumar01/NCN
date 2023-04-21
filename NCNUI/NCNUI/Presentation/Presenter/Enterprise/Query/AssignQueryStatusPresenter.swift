//
//  AssignQueryStatusPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
import NCN_BackEnd

class AssignQueryStatusPresenter {
    weak var view: AssignQueryStatusViewContract?
    var assignQueryStatus: AssignQueryStatus
    weak var router: AssignQueryStatusRouterContract?

    init(assignQueryStatus: AssignQueryStatus) {
        self.assignQueryStatus = assignQueryStatus
    }
}

extension AssignQueryStatusPresenter: AssignQueryStatusPresenterContract {
    func viewLoaded(queryId: Int) {
        let request = AssignQueryStatusRequest(queryId: queryId)
        assignQueryStatus.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension AssignQueryStatusPresenter {
    func result(response: String) {
        view?.load(response: response)
    }

    func failed(loginError: String) {
        view?.load(response: loginError)
    }
}
