//
//  BuyServiceDatabaseServiceContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 29/03/23.
//

import Foundation
public protocol BuyServiceDatabaseServiceContract {
    func buyService(userId: Int, employeeId: Int, serviceId: Int, subscritpionId: Int, enterpriseId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
