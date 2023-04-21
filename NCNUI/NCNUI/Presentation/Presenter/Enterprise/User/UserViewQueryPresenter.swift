//
//  ViewUserQueryPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import NCN_BackEnd
class ViewUserQueryPresenter {
    weak var view: ViewUserQueryViewContract?
    var ViewUserQuery: ViewUserQuery
    weak var router: ViewUserQueryRouterContract?

    init(ViewUserQuery: ViewUserQuery) {
        self.ViewUserQuery = ViewUserQuery
    }
}

extension ViewUserQueryPresenter: ViewUserQueryPresenterContract {
    func viewLoaded(userId: Int) {
        let request = ViewUserQueryRequest(userId: userId)
        ViewUserQuery.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension ViewUserQueryPresenter {
    func result(message: [Query]) {
        for query in message{
            
            view?.load(response: "queryId: " + String(query.queryId))
            view?.load(response: query.queryMessage)
            if (query.queryType.rawValue == 1 ) {
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
