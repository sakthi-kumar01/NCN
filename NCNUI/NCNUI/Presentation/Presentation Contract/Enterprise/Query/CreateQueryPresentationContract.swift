//
//  CreateQueryPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 28/03/23.
//

import Foundation
import NCN_BackEnd
protocol CreateQueryViewContract: AnyObject {
    func load(response: String)
    func failed(error: String)
}

protocol CreateQueryPresenterContract {
    func viewLoaded(queryId: Int, queryType: QueryType, queryMessage: String, queryDate: Date, enterpriseId: Int, userId: Int, employeeId: Int)
}

protocol CreateQueryRouterContract: AnyObject {
    func selected(response: String)
}
