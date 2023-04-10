//
//  AssignQueryStatusPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
protocol AssignQueryStatusViewContract: AnyObject {
    func load(message: String)
}

protocol AssignQueryStatusPresenterContract {
    func viewLoaded(queryId: Int)
}

protocol AssignQueryStatusRouterContract: AnyObject {
    func selected(message: String)
}
