//
//  DataExtension.swift
//  VTComponents
//
//  Created by Robin Rajasekaran on 02/09/21.
//

import Foundation

public extension Data {
    var json: Any? {
        return try? JSONSerialization.jsonObject(with: self, options: [])
    }
}
