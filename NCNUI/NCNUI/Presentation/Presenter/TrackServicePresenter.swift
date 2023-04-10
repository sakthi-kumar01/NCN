//
//  TrackServicePresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import NCN_BackEnd

class TrackServicePresenter {
    weak var view: TrackServiceViewContract?
    var trackService: TrackService
    weak var router: TrackServiceRouterContract?

    init(trackService: TrackService) {
        self.trackService = trackService
    }
}

extension TrackServicePresenter: TrackServicePresenterContract {
    func viewLoaded(employeeId: Int) {
        let request = TrackServiceRequest(employeeId: employeeId)
        trackService.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension TrackServicePresenter {
    func result(message: [Service]) {
        for service in message {
            view?.load(message: service.serviceTitle)
            view?.load(message: service.serviceDescription)
        }
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
