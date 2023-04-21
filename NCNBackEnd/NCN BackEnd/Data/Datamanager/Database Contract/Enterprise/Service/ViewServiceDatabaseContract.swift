//
//  ViewServiceDatabaseServiceContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 23/03/23.
//

import Foundation
public protocol ViewServiceDatabaseServiceContract {
    func viewService(success: @escaping ([AvailableService]) -> Void, failure: @escaping (String) -> Void)
}
