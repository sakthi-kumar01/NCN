//
//  TrackServiceClientPresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation
protocol TrackClientServiceViewContract: AnyObject {
    func load(message: String)
}

protocol TrackClientServicePresenterContract {
    func viewLoaded(userId: Int)
}

protocol TrackClientServiceRouterContract: AnyObject {
    func selected(message: String)
}
