//
//  SetEnterpriseNameDatabase.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 20/03/23.
//

import Foundation
public class SetEnterpriseDatabase: SetEnterpriseDatabaseContract {
    public var enterPrise: [Enterprise] = []

    public init() {}

    public func setEnterpriseName(enterpriseName: String, success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        let newEnterPrise = Enterprise(enterpriseName: enterpriseName)
        if newEnterPrise.enterpriseName == "raja" {
            success("new enterprise created")
        } else {
            failure("No data")
        }
    }
}
