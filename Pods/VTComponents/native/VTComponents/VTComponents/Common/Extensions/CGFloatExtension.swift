//
//  CGFloatExtension.swift
//  ZohoMail
//
//  Created by Robin Rajasekaran on 01/10/19.
//  Copyright © 2019 Zoho Corporation. All rights reserved.
//

import CoreGraphics // NOTE: imported for support of CGFloat in watchOS
import Foundation

public extension CGFloat {
    func evenCeiled() -> CGFloat {
        let value = ceil(self)
        if value.truncatingRemainder(dividingBy: 2) == 0 {
            return value
        } else {
            return value + 1
        }
    }
}
