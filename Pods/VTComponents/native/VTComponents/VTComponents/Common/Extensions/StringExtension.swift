//
//  StringExtension.swift
//  ZohoMail
//
//  Created by Robin Rajasekaran on 19/12/18.
//  Copyright © 2018 Zoho Corporation. All rights reserved.
//

import Foundation

public extension String {
    var length: Int {
        return (self as NSString).length
    }

    func toBool() -> Bool? {
        switch lowercased() {
        case "true", "yes", "1":
            return true
        case "false", "no", "0":
            return false
        default:
            if let value = Int(self), value > 0 // Added this to fix if the string contains integer values > 1 to return true
            {
                return true
            }
            return nil
        }
    }

    func replacingWhiteSpaceCharacters() -> String {
        var str = self
        for index in 0 ... str.length - 1 {
            if str.isWhitespaceCharacter(in: NSRange(location: index, length: 1)) {
                str = (str as NSString).replacingCharacters(in: NSRange(location: index, length: 1), with: " ")
            }
        }
        return str
    }

    func isWhitespaceCharacter(in range: NSRange) -> Bool {
        if let character = (self as NSString).substring(with: range).utf16.first, CharacterSet.whitespacesAndNewlines.contains(UnicodeScalar(character)!) {
            return true
        }
        return false
    }

    func getPlaceHolderLetters(limit: Int = 2, upperCased: Bool = true) -> String {
        if isEmpty {
            return ""
        }
        var result = ""
        let splitedArr = split(separator: " ")
        for wordSequence in splitedArr {
            let word = String(wordSequence)
            if let firstLetter = getFirstAlphabet(from: word) {
                result += firstLetter
            }
            if result.count == limit {
                break
            }
        }
        if result.isEmpty, let char = first {
            result = String(char)
        }
        result = upperCased ? result.uppercased() : result
        return result
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = capitalizingFirstLetter()
    }

    func trimTrailingWhitespaces() -> String {
        var trimmedString = self
        while trimmedString.last?.isWhitespace == true {
            trimmedString = String(trimmedString.dropLast())
        }
        return trimmedString
    }

    func insensitiveContains(_ string: String) -> Bool {
        return range(of: string, options: [.diacriticInsensitive, .caseInsensitive, .widthInsensitive]) != nil
    }

    // MARK: - Helper methods

    private func getFirstAlphabet(from string: String) -> String? {
        for uniCode in string.unicodeScalars {
            if CharacterSet.letters.contains(uniCode) {
                return String(uniCode)
            }
        }
        return nil
    }
}

// URL Encoding

public extension String {
    func encodeValue(with additionalCharacterSet: CharacterSet? = nil) -> String {
        // Altered characterSet to encode additional invalid characters (Narayanan U)

        var charSet = CharacterSet(charactersIn: "=+&:,'\"#%/<>?@\\^`{|} ").inverted // CharacterSet.urlQueryAllowed // or use inverted set of "=+&:,'\"#%/<>?@\\^`{|}"
        if additionalCharacterSet != nil {
            charSet = charSet.intersection(additionalCharacterSet!)
        }
        let result: String = addingPercentEncoding(withAllowedCharacters: charSet)!
        return result
    }

    func encodeURL() -> String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }

    func encodeURLIfNotValid() -> URL? {
        if let url = URL(string: self) {
            return url
        } else if let encodedURLStr = encodeURL() {
            return URL(string: encodedURLStr)
        }
        return nil
    }
}

public extension String {
    mutating func replacingOccurrencesWithLiteralSearch(of string: String, with target: String) {
        self = replacingOccurrences(of: string, with: target, options: .literal, range: Range(NSMakeRange(0, length), in: self))
    }

    func getURLLogDescription() -> String {
        return replacingOccurrences(of: NSUserName(), with: "***")
    }
}
