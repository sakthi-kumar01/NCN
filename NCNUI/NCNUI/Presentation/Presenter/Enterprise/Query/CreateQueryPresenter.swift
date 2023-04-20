//
//  CreateQueryPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 28/03/23.
//

import Foundation
import NCN_BackEnd
public class CreateQueryPresenter {
    weak var view: CreateQueryViewContract?
    var createQuery: CreateQuery
    weak var router: CreateQueryRouterContract?
    init(createQuery: CreateQuery) {
        self.createQuery = createQuery
    }
}

extension CreateQueryPresenter: CreateQueryPresenterContract {
    func viewLoaded(queryId: Int, queryType: QueryType, queryMessage: String, queryDate: Date, enterpriseId: Int, userId: Int, employeeId: Int) {
        let request = CreateQueryRequest(queryId: queryId, queryType: queryType, queryMessage: queryMessage, queryDate: queryDate, enterpriseId: enterpriseId, userId: userId, employeeId: employeeId)
        createQuery.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response)
        }, onFailure: { [weak self] error in
            self?.failed(error: error)
        })
    }
}

extension CreateQueryPresenter {
    func result(response: CreateQueryResponse) {
        view?.load(response: response.response)
    }

    func failed(error: CreateQueryError) {
        view?.failed(error: error.error)
    }
}
