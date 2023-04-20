//
//  ClientTrackServicePresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
import NCN_BackEnd

public class ClientTrackServicePresenter {
    public weak var view: ClientTrackServiceViewContract?
    public var ClientTrackService: ClientTrackService
    public weak var router: ClientTrackServiceRouterContract?

    public init(ClientTrackService: ClientTrackService) {
        self.ClientTrackService = ClientTrackService
    }
}

extension ClientTrackServicePresenter: ClientTrackServicePresenterContract {
    public func viewLoaded(id: Int, subscriptionUsage: Int, userId: Int) {
        let request = ClientTrackServiceRequest(userId: userId, id: id, subscriptionUsage: subscriptionUsage)
        ClientTrackService.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension ClientTrackServicePresenter {
    func result(message: String) {
        view?.load(message: message)
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
