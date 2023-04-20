//
//  DeleteQueryPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
protocol DeleteQueryViewContract: AnyObject {
    func load(message: String)
}

protocol DeleteQueryPresenterContract {
    func viewLoaded(queryId: Int)
}

protocol DeleteQueryRouterContract: AnyObject {
    func selected(message: String)
}
