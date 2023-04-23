//
//  ViewEmployeeQueryPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import NCN_BackEnd
class ViewEmployeeQueryPresenter {
    weak var view: ViewEmployeeQueryViewContract?
    var ViewEmployeeQuery: ViewEmployeeQuery
    weak var router: ViewEmployeeQueryRouterContract?

    init(ViewEmployeeQuery: ViewEmployeeQuery) {
        self.ViewEmployeeQuery = ViewEmployeeQuery
    }
}

extension ViewEmployeeQueryPresenter: ViewEmployeeQueryPresenterContract {
    func viewLoaded(employeeId: Int) {
        let request = ViewEmployeeQueryRequest(employeeId: employeeId)
        ViewEmployeeQuery.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension ViewEmployeeQueryPresenter {
    func result(message: [Query]) {
        for query in message {
            view?.load(response: String(query.queryId))
            view?.load(response: query.queryMessage)
            if query.queryType.rawValue == 1 {
                view?.load(response: "Feedback")
            } else {
                view?.load(response: "Complaint")
            }
            view?.load(response: query.querystatus.description)
        }
    }

    func failed(loginError: String) {
        view?.load(response: loginError)
    }
}
