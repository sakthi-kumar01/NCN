//
//  RemoveUserPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
protocol RemoveUserViewContract: AnyObject {
    func load(message: String)
}

protocol RemoveUserPresenterContract {
    func viewLoaded(userId: Int)
}

protocol RemoveUserRouterContract: AnyObject {
    func selected(message: String)
}
