//
//  UserViewQueryPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
protocol UserViewQueryViewContract: AnyObject {
    func load(message: String)
}

protocol UserViewQueryPresenterContract {
    func viewLoaded(userId: Int)
}

protocol UserViewQueryRouterContract: AnyObject {
    func selected(message: String)
}
