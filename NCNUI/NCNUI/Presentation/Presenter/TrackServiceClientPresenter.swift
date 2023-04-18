//
//  TrackServiceClientPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import NCN_BackEnd

public class TrackClientServicePresenter {
    public weak var view: TrackClientServiceViewContract?
    public var trackClientService: TrackClientService
    public weak var router: TrackClientServiceRouterContract?

    public init(trackClientService: TrackClientService) {
        self.trackClientService = trackClientService
    }
}

extension TrackClientServicePresenter: TrackClientServicePresenterContract {
    public func viewLoaded(id: Int, subscriptionUsage: Int, userId: Int) {
        let request = TrackClientServiceRequest(userId: userId, id: id, subscriptionUsage: subscriptionUsage)
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
