//
//  TrackServiceClientPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import NCN_BackEnd

class TrackClientServicePresenter {
    weak var view: TrackClientServiceViewContract?
    var trackClientService: TrackClientService
    weak var router: TrackClientServiceRouterContract?

    init(trackClientService: TrackClientService) {
        self.trackClientService = trackClientService
    }
}

extension TrackClientServicePresenter: TrackClientServicePresenterContract {
    func viewLoaded(userId: Int) {
        let request = TrackClientServiceRequest(userId: userId)
        trackClientService.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension TrackClientServicePresenter {
    func result(message: String) {
        view?.load(message: message)
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
