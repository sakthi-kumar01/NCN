//
//  Client.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 17/03/23.
//

import Foundation
public class Client: User {
    public var clientId: Int = 0
    public var query: [Query]?
    public var services: [Service]?
}
