//
//  ViewUserQueryPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
protocol ViewUserQueryViewContract: AnyObject {
    func load(message: String)
}

protocol ViewUserQueryPresenterContract {
    func viewLoaded(userId: Int)
}

protocol ViewUserQueryRouterContract: AnyObject {
    func selected(message: String)
}
