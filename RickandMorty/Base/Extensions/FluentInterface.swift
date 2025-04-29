//
//  FluentInterface.swift
//  RickandMorty
//
//  Created by andre mietti on 11/04/25.
//

import Foundation

//MARK: - Fluent Interface
public protocol With {}

extension With where Self: AnyObject {
    @discardableResult
    func with<T>(_ property: ReferenceWritableKeyPath<Self, T>, setValue value: T) -> Self {
        self[keyPath: property] = value
        return self
    }
}

// MARK: - Configure

public func configure<T>(
    _ value: T,
    using closure: (inout T) throws -> Void) rethrows -> T {
    var value = value
    try closure(&value)
    return value
}
