//
//  SetEnterpriseNamePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 13/04/23.
//

import Foundation
protocol GetEnterpriseNameViewContract: AnyObject {
    func load(response: String)
}

protocol GetEnterpriseNamePresenterContract {
    func viewLoaded(id: Int)
}

protocol GetEnterpriseNameRouterContract: AnyObject {
    func selected(response: String)
}
