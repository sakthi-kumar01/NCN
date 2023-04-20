//
//  ViewUserQueryDatabaseContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
public protocol ViewUserQueryDatabaseContract {
    func ViewUserQuery(userId: Int, success: @escaping ([Query]) -> Void, failure: @escaping (String) -> Void)
}
