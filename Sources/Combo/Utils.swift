//
//  File.swift
//  
//
//  Created by 13402598 on 09/05/2024.
//

import Foundation

public struct QueryUtils {
    private var operators: QueryOperators
    
    init(operators: QueryOperators) {
        self.operators = operators
    }
    
    public func filter<T: Query.QueryItemType>(items: [T]) -> [T] {
        return filter(operators: operators, items: items)
    }
    
    public func filter<T: Query.QueryItemType>(operators: QueryOperators, items: [T]) -> [T] {
        return NSArray(array: items).filtered(using: operators.predicate) as? [T] ?? []
    }
}
