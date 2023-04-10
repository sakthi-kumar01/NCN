//
//  SerachClientPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
protocol SearchClientViewContract: AnyObject {
    func load(message: String)
}

protocol SearchClientPresenterContract {
    func viewLoaded(employeeId: Int)
}

protocol SearchClientRouterContract: AnyObject {
    func selected(message: String)
}
