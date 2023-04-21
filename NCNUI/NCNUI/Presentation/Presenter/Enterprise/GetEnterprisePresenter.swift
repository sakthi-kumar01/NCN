//
//  GetEnterprisePresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 20/04/23.
//

import Foundation
import NCN_BackEnd
class GetEnterpriseNamePresenter {
    weak var view: GetEnterpriseNameViewContract?
    var getEnterpriseName: GetEnterpriseName
    weak var router: GetEnterpriseNameRouterContract?

    init(getEnterpriseName: GetEnterpriseName) {
        self.getEnterpriseName = getEnterpriseName
    }
}

extension GetEnterpriseNamePresenter: GetEnterpriseNamePresenterContract {
    func viewLoaded() {
        let request = GetEnterpriseNameRequest()
        getEnterpriseName.execute(request: request, onSuccess: { [weak self] response in
            self?.result(response: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension GetEnterpriseNamePresenter {
    func result(response: Enterprise) {
        
            
        view?.load(response: response.enterpriseId.description)
            
        
    }

    func failed(loginError: String) {
        view?.load(response: loginError)
    }
}
