//
//  TrackQueryPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import NCN_BackEnd

class TrackQueryPresenter {
    weak var view: TrackQueryViewContract?
    var trackQuery: TrackQuery
    weak var router: TrackQueryRouterContract?

    init(trackQuery: TrackQuery) {
        self.trackQuery = trackQuery
    }
}

extension TrackQueryPresenter: TrackQueryPresenterContract {
    func viewLoaded(employeeId: Int) {
        let request = TrackQueryRequest(employeeId: employeeId)
        trackQuery.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension TrackQueryPresenter {
    func result(message: [Query]) {
        for query in message {
            view?.load(response: String(query.queryId))
            view?.load(message: query.queryMessage)
            view?.load(response: String(query.queryType.rawValue))
            view?.load(message: query.querystatus.description)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            var queryDate = dateFormatter.string(from: query.queryDate)
            view?.load(message: queryDate)
        }
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
