//
//  KeychainManager.swift
//  NCN BackEnd
//
//  Created by raja-16327 on 19/04/23.
//

import Foundation
import Security

class KeychainManager {
    static let shared = KeychainManager()

    private init() {}

    enum KeychainError: Error {
        case detailsnotFound
        case unexpectedStatus(OSStatus)
        case invalidItemFormat
    }

    func save(email: String, password: String) throws {
        let passwordData = password.data(using: .utf8)!
        let query: [String: AnyObject] = [
            kSecAttrService as String: "com.zoho.NCN" as AnyObject,
            kSecAttrAccount as String: email as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: passwordData as AnyObject
        ]

        let status = SecItemAdd(query as CFDictionary, nil)

        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }
    }

    func update(email: String, newPassword: String) throws {
        let passwordData = newPassword.data(using: .utf8)!
        let query: [String: AnyObject] = [
            kSecAttrService as String: "com.zoho.NCN" as AnyObject,
            kSecAttrAccount as String: email as AnyObject,
            kSecClass as String: kSecClassGenericPassword
        ]

        let attributesToUpdate: [String: AnyObject] = [
            kSecValueData as String: passwordData as AnyObject
        ]

        let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)

        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }
    }

    func retrieve(email: String) throws -> String {
        let query: [String: AnyObject] = [
            kSecAttrService as String: "com.zoho.NCN" as AnyObject,
            kSecAttrAccount as String: email as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue
        ]

        var itemCopy: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &itemCopy)

        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }

        guard let passwordData = itemCopy as? Data,
              let password = String(data: passwordData, encoding: .utf8) else {
            throw KeychainError.invalidItemFormat
        }

        return password
    }

    func delete(email: String) throws {
        let query: [String: AnyObject] = [
            kSecAttrService as String: "com.zoho.NCN" as AnyObject,
            kSecAttrAccount as String: email as AnyObject,
            kSecClass as String: kSecClassGenericPassword
        ]

        let status = SecItemDelete(query as CFDictionary)

        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }
    }
}

