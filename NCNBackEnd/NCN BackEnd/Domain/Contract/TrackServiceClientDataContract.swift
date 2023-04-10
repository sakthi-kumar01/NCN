//
//  TrackServiceClientDataContract.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 31/03/23.
//

import Foundation

public protocol TrackClientServiceDataContract {
    func trackClientService(userId: Int, success: @escaping ([Service]) -> Void, failure: @escaping (String) -> Void)
}
