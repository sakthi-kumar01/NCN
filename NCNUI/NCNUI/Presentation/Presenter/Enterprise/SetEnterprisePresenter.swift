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
            self?.result(response: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(error: loginError.error)
        })
    }
}

extension SetEnterpriseNamePresenter {
    func result(response: String) {
        view?.load(response: response)
    }

    func failed(error: String) {
        view?.load(response: error)
    }
    
    
}
