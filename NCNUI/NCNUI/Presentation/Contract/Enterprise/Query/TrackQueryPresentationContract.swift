//
//  TrackQueryPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
protocol TrackQueryViewContract: AnyObject {
    func load(message: String)
}

protocol TrackQueryPresenterContract {
    func viewLoaded(employeeId: Int)
}

protocol TrackQueryRouterContract: AnyObject {
    func selected(message: String)
}
