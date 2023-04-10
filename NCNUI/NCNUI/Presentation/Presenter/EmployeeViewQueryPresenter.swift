//
//  EmployeeViewQueryPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import NCN_BackEnd
class EmployeeViewQueryPresenter {
    weak var view: EmployeeViewQueryViewContract?
    var employeeViewQuery: EmployeeViewQuery
    weak var router: EmployeeViewQueryRouterContract?

    init(employeeViewQuery: EmployeeViewQuery) {
        self.employeeViewQuery = employeeViewQuery
    }
}

extension EmployeeViewQueryPresenter: EmployeeViewQueryPresenterContract {
    func viewLoaded(employeeId: Int) {
        let request = EmployeeViewQueryRequest(employeeId: employeeId)
        employeeViewQuery.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension EmployeeViewQueryPresenter {
    func result(message: [Query]) {
        for query in message{
            
            view?.load(message: String(query.queryId))
            view?.load(message: query.queryMessage)
            if (query.queryType.rawValue == 1 ) {
                view?.load(message: "Feedback")
            } else {
                view?.load(message: "Complaint")
            }
            view?.load(message: query.querystatus.description)
        }
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
