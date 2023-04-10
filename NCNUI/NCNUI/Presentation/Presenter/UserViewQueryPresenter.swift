//
//  UserViewQueryPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import NCN_BackEnd
class UserViewQueryPresenter {
    weak var view: UserViewQueryViewContract?
    var userViewQuery: UserViewQuery
    weak var router: UserViewQueryRouterContract?

    init(userViewQuery: UserViewQuery) {
        self.userViewQuery = userViewQuery
    }
}

extension UserViewQueryPresenter: UserViewQueryPresenterContract {
    func viewLoaded(userId: Int) {
        let request = UserViewQueryRequest(userId: userId)
        userViewQuery.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension UserViewQueryPresenter {
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
