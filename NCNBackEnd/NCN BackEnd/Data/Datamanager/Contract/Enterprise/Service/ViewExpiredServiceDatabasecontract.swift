//
//  ViewExpiredServiceDatabaseServiceContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 09/04/23.
//

import Foundation
public protocol ViewExpiredServiceDatabaseServiceContract {
    func viewExpiredService( success: @escaping ([[String]]) -> Void, failure: @escaping (String) -> Void)
}
