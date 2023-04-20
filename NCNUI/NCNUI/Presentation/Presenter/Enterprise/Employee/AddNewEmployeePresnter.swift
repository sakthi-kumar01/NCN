//
//  AddNewEmployeePresnter.swift
//  NCNUI
//
//  Created by raja-16327 on 24/03/23.
//

import Foundation
import NCN_BackEnd
import VTComponents
public class AddNewEmployeePresenter {
    weak var view: AddNewEmployeeViewContract?
    var addNewEmployee: AddNewEmployee
    weak var router: AddNewEmployeeRouterContract?

    init(addNewEmployee: AddNewEmployee) {
        self.addNewEmployee = addNewEmployee
    }
}

extension AddNewEmployeePresenter: AddNewEmployeePresenterContract {
    func viewLoaded() {
        let request = AddNewEmployeeRequest(userName: "raja", password: "sakthi", email: "kabsdbashbd@zoho.com", mobileNumber: 1_234_567_890, employeeType: 5, enterpriseId: 1)
        addNewEmployee.execute(request: request, onSuccess: {
            [weak self] response in
            self?.result(response: response)
        }, onFailure: {
            [weak self] loginError in
            self?.failed(error: loginError)
        })
    }
}

extension AddNewEmployeePresenter {
    func result(response: AddNewEmployeeResponse) {
        view?.load(message: response.response)
    }

    func failed(error: AddNewEmployeeError) {
        view?.failed(error: error.error)
    }
}
