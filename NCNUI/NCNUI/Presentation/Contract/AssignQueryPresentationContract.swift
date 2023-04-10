//
//  AssignQueryPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 08/04/23.
//

import Foundation
protocol AssignQueryViewContract: AnyObject {
    func load(message: String)
}

protocol AssignQueryPresenterContract {
    func viewLoaded(employeeId: Int, queryId: Int)
}

protocol AssignQueryRouterContract: AnyObject {
    func selected(message: String)
}
