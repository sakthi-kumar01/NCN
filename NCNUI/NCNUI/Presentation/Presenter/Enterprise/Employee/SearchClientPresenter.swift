//
//  SearchClientPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import NCN_BackEnd
class SearchClientPresenter {
    weak var view: SearchClientViewContract?
    var searchClient: SearchClient
    weak var router: SearchClientRouterContract?

    init(searchClient: SearchClient) {
        self.searchClient = searchClient
    }
}

extension SearchClientPresenter: SearchClientPresenterContract {
    func viewLoaded(userId: Int, employeeId: Int) {
        let request = SearchClientRequest(userId: userId, employeeId: employeeId)
        searchClient.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension SearchClientPresenter {
    func result(message: [User]) {
        for user in message {
            view?.load(response: "UserName: " + user.userName)
            view?.load(response: "password: " + user.password)
            view?.load(response: "email id: " + user.email)
            view?.load(response: "mobile number: " + user.mobileNumber.description)
            view?.load(response: "")
        }
    }

    func failed(loginError: String) {
        view?.load(response: loginError)
    }
}
