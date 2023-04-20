//
//  ViewServiceDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 23/03/23.
//

import Foundation
import VTComponents
public protocol ViewServiceDatacontract {
    func viewService(success: @escaping ([AvailableService]) -> Void, failure: @escaping (String) -> Void)
}
