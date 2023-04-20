//
//  SetEnterprisePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 13/04/23.
//

import Foundation
protocol SetEnterpriseNameViewContract: AnyObject {
    func load(response: String)
}

protocol SetEnterpriseNamePresenterContract {
    func viewLoaded(enterpriseName: String)
}

protocol SetEnterpriseNameRouterContract: AnyObject {
    func selected(response: String)
}
