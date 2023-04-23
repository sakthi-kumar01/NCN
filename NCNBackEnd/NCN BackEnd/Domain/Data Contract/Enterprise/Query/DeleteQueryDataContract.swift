//
//  DeleteQueryDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 10/04/23.
//

import Foundation
public protocol DeleteQueryDataContract {
    func deleteQuery(queryId: Int, success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
}
