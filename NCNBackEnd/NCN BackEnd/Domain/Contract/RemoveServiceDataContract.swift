//
//  RemoveServiceDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
public protocol RemoveServiceDataContract {
   func removeService(serviceId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
