//
//  SetEnterpriseDatabaseServiceContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/03/23.
//

import Foundation
public protocol SetEnterpriseDatabaseServiceContract {
    func setEnterpriseName(enterpriseName: String, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
