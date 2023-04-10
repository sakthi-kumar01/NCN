//
//  URLExtension.swift
//  VTComponents
//
//  Created by agneesh on 27/09/22.
//

import Foundation

public extension URL {
    var logDescription: String {
        absoluteString.getURLLogDescription()
    }
}
