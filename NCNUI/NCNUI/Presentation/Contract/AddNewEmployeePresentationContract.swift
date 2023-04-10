//
//  AddNewEmployeePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 24/03/23.
//

import Foundation
protocol AddNewEmployeeViewContract: AnyObject {
    func load(message: String)
    func failed(error: String)
}

protocol AddNewEmployeePresenterContract {
    func viewLoaded()
}

protocol AddNewEmployeeRouterContract: AnyObject {
    func selected(message: String)
}
