//
//  SetEnterpriseNamePresentationContract.swift
//  NCNUI
//
//  Created by raja-16327 on 13/04/23.
//

import Foundation
protocol SetEnterpriseViewContract: AnyObject {
    func load(message: String)
}

protocol SetEnterprisePresenterContract {
    func viewLoaded(enterPreiseName: String)
}

protocol SetEnterpriseRouterContract: AnyObject {
    func selected(message: String)
}
 
