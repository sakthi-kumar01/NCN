//
//  SerachClientPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
protocol SearchClientViewContract: AnyObject {
    func load(response: String)
}

protocol SearchClientPresenterContract {
    func viewLoaded(userId:Int, employeeId: Int)
}

protocol SearchClientRouterContract: AnyObject {
    func selected(response: String)
}
