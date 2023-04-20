//
//  SetEnterprisePresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 13/04/23.
//

import Foundation

import NCN_BackEnd

class SetEnterpriseNamePresenter {
    weak var view: SetEnterpriseNameViewContract?
    var setEnterpriseName: SetEnterpriseName
    weak var router: SetEnterpriseNameRouterContract?

    init(setEnterpriseName: SetEnterpriseName) {
        self.setEnterpriseName = setEnterpriseName
    }
}

extension SetEnterpriseNamePresenter: SetEnterpriseNamePresenterContract {
    
    
    func viewLoaded(enterpriseName: String) {
        let request = SetEnterpriseNameRequest(enterpriseName: enterpriseName)
        setEnterpriseName.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension SetEnterpriseNamePresenter {
    func result(message: String) {
        view?.load(message: message)
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
    
    
}
