//
//  GetEnterpriseDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/04/23.
//

import Foundation
public protocol GetEnterpriseNameDataContract {
   func getEnterpriseName( success: @escaping (Enterprise) -> Void, failure: @escaping (String) -> Void)
}
