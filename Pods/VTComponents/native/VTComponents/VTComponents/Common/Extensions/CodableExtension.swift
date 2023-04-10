//
//  CodableExtensions.swift
//
//  Created by Imthath M on 21/02/19.
//  No Copyright.
//

import Foundation

private let encoder = JSONEncoder()
private let decoder = JSONDecoder()

public extension Encodable {
    var jsonString: String? {
        do {
            return try String(data: encoder.encode(self), encoding: .utf8)
        } catch {
            return nil
        }
    }

    var jsonData: Data? {
        return try? encoder.encode(self)
    }

    var dictionary: [String: Any]? {
        return (try? JSONSerialization.jsonObject(with: encoder.encode(self),
                                                  options: .allowFragments))
            .flatMap { $0 as? [String: Any] }
    }
}

public extension Decodable {
    init?(from jsonString: String) {
        let data = Data(jsonString.utf8)
        guard let object = try? decoder.decode(Self.self, from: data) else { return nil }
        self = object
    }

    init?(from jsonData: Data) {
        guard let object = try? decoder.decode(Self.self, from: jsonData) else { return nil }
        self = object
    }
}

public protocol Imitable: Codable {
    var copy: Self? { get }
}

public extension Imitable {
    var copy: Self? {
        guard let data = try? encoder.encode(self) else { return nil }
        return try? decoder.decode(Self.self, from: data)
    }
}

public protocol Distinguishable: Codable {
    func isDistinct(from other: Self) -> Bool
}

public extension Distinguishable {
    func isDistinct(from other: Self) -> Bool {
        return jsonData != other.jsonData
    }
}

public extension Data {
    var dictionary: [String: Any]? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: .mutableLeaves) as? [String: Any]
        } catch {
            return nil
        }
    }
}
