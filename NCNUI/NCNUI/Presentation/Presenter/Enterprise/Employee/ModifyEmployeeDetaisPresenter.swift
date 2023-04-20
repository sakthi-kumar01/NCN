//
//  ModifyEmployeeDetaisPresenter.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
import NCN_BackEnd
class ModifyEmployeeDetailsPresenter {
    weak var view: ModifyEmployeeDetailsViewContract?
    var modifyEmployeeDetails: ModifyEmployeeDetails
    weak var router: ModifyEmployeeDetailsRouterContract?

    init(modifyEmployeeDetails: ModifyEmployeeDetails) {
        self.modifyEmployeeDetails = modifyEmployeeDetails
    }
}

extension ModifyEmployeeDetailsPresenter: ModifyEmployeeDetailsPresenterContract {
    func viewLoaded(userId: Int, userName: String, password: String, eMail: String, mobileNo: Int) {
        let request = ModifyEmployeeDetailsRequest(userId: userId, userName: userName, password: password, eMail: eMail, mobileNo: mobileNo)
        modifyEmployeeDetails.execute(request: request, onSuccess: { [weak self] response in
            self?.result(message: response.response)
        }, onFailure: { [weak self] loginError in
            self?.failed(loginError: loginError.error)
        })
    }
}

extension ModifyEmployeeDetailsPresenter {
    func result(message: String) {
        view?.load(message: message)
    }

    func failed(loginError: String) {
        view?.load(message: loginError)
    }
}
