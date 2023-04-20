//
//  DeleteQueryPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
import NCN_BackEnd

class DeleteQueryPresenter {
    weak var view: DeleteQueryViewContract?
    var deleteQuery: DeleteQuery
    weak var router: DeleteQueryRouterContract?

    init(deleteQuery: DeleteQuery) {
        self.deleteQuery = deleteQuery
    }
}

extension DeleteQueryPresenter: DeleteQueryPresenterContract {
    func viewLoaded(queryId: Int) {
        let request = DeleteQueryRequest(queryId: queryId)
        deleteQuery.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension DeleteQueryPresenter {
    func result(response: String) {
        view?.load(message: message)
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
