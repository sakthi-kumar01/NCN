//
//  TrackServicePresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import NCN_BackEnd

public class TrackServicePresenter {
    weak var view: TrackServiceViewContract?
    var trackService: TrackService
    weak var router: TrackServiceRouterContract?

    init(trackService: TrackService) {
        self.trackService = trackService
    }
}

extension TrackServicePresenter: TrackServicePresenterContract {
    func viewLoaded(id: Int, subscriptionUsage: Int, employeeId: Int) {
        let request = TrackServiceRequest(id: id, subscriptionUsage: subscriptionUsage, employeeId: employeeId)
        trackService.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension TrackServicePresenter {
    func result(response: String) {
        view?.load(response: response)
    }

    func failed(loginError: String) {
        view?.load(response: loginError)
    }
}
