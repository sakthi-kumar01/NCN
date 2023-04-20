//
//  AssignQueryStatusPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
protocol AssignQueryStatusViewContract: AnyObject {
    func load(response: String)
}

protocol AssignQueryStatusPresenterContract {
    func viewLoaded(queryId: Int)
}

protocol AssignQueryStatusRouterContract: AnyObject {
    func selected(response: String)
}
