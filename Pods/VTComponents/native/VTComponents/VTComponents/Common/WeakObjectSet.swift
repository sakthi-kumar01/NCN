//
//  WeakObjectSet.swift
//  CliqUiController
//
//  Created by vel-9174 on 03/04/22.
//  Copyright © 2022 Zoho Corporation. All rights reserved.
//

import Foundation

public class WeakObject<T: AnyObject>: Equatable, Hashable {
    public weak var object: T?
    private let hashKey: Int

    init(_ object: T) {
        self.object = object
        hashKey = ObjectIdentifier(object).hashValue
    }

    public static func == (lhs: WeakObject<T>, rhs: WeakObject<T>) -> Bool {
        if lhs.object == nil || rhs.object == nil { return false }
        return lhs.object === rhs.object
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(object.debugDescription)
    }
}

public class WeakObjectSet<T: AnyObject> {
    public var isEmpty: Bool {
        return _objects.isEmpty
    }

    public var _objects: Set<WeakObject<T>>

    public init() {
        _objects = Set<WeakObject<T>>([])
    }

    public init(_ objects: [T]) {
        _objects = Set<WeakObject<T>>(objects.map { WeakObject($0) })
    }

    public var objects: [T] {
        return _objects.compactMap { $0.object }
    }

    public func contains(_ object: T) -> Bool {
        return _objects.contains(WeakObject(object))
    }

    public func addObject(_ object: T) {
        _objects.insert(WeakObject(object))
    }

    public func addingObject(_ object: T) -> WeakObjectSet<T> {
        return WeakObjectSet(objects + [object])
    }

    public func addObjects(_ objects: [T]) {
        _objects.formUnion(objects.map { WeakObject($0) })
    }

    public func addingObjects(_ objects: [T]) -> WeakObjectSet<T> {
        return WeakObjectSet(self.objects + objects)
    }

    public func removeAllObjects() {
        _objects.removeAll()
    }

    public func removeObject(_ object: T) {
        _objects.remove(WeakObject(object))
    }

    public func removingObject(_ object: T) -> WeakObjectSet<T> {
        var temporaryObjects = _objects
        temporaryObjects.remove(WeakObject(object))
        return WeakObjectSet(temporaryObjects.compactMap { $0.object })
    }

    public func removeObjects(_ objects: [T]) {
        _objects.subtract(objects.map { WeakObject($0) })
    }

    public func removingObjects(_ objects: [T]) -> WeakObjectSet<T> {
        let temporaryObjects = _objects.subtracting(objects.map { WeakObject($0) })
        return WeakObjectSet(temporaryObjects.compactMap { $0.object })
    }
}
