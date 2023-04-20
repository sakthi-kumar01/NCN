//
//  DeleteQueryPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
protocol DeleteQueryViewContract: AnyObject {
    func load(response: String)
}

protocol DeleteQueryPresenterContract {
    func viewLoaded(queryId: Int)
}

protocol DeleteQueryRouterContract: AnyObject {
    func selected(response: String)
}
