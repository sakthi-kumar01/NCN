//
//  BuyServiceDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 28/03/23.
//

import Foundation
public protocol BuyServiceDataContract {
    func buyService(userId: Int, employeeId: Int, serviceId: Int, subscriptionId: Int, enterpriseId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
