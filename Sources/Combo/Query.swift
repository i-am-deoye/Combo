//
//  File.swift
//  
//
//  Created by 13402598 on 09/05/2024.
//

import Foundation


@propertyWrapper public struct Query {
    public var operators: QueryOperators
    public lazy var utils: QueryUtils = .init(operators: operators)
    
    public init(operators: QueryOperators) {
        self.operators = operators
    }
    

    public var wrappedValue: QueryUtils {
        mutating get {
            return utils
        }
    }
}

extension Query {
    public protocol QueryItemType: Codable {}
}
