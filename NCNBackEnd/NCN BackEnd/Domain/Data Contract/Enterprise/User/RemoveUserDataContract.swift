//
//  RemoveUserDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
public protocol RemoveUserDataContract {
    func removeUser(userId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
