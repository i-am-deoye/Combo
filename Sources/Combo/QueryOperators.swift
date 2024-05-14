//
//  File.swift
//  
//
//  Created by 13402598 on 24/04/2024.
//

import Foundation


public final class QueryOperators {
    
    private var _query:String = ""
    
    public var predicate: NSPredicate {
        return NSPredicate(format: toString())
    }
    
    public init(){}
    
    
    
    public func toString() -> String{
        return _query
    }
    
    public func isNil(key:String) -> QueryOperators {
        _query = _query + "\(key) == nil"
        return self
    }
    
    public func isNotNil(key:String) -> QueryOperators{
        _query = _query + "\(key) != nil"
        return self
    }
    
    public func isNotBetween(key:String, leftValue:Any, rightValue:Any) -> QueryOperators {
        return not(isBetween(key: key, leftValue: leftValue, rightValue: rightValue))
    }
    
    public func isBetween(key:String, leftValue:Any, rightValue:Any) -> QueryOperators{
        _query = _query + " \(key) BETWEEN \(leftValue) AND \(rightValue)"
        return self
    }
    
    public func isNotIn(key:String, values:[Any]) -> QueryOperators{
        return not(isIn(key: key, values: values))
    }
    
    public func isIn(key:String, values:[Any]) -> QueryOperators{
        var temp = ""
        values.forEach { (val) in
            temp = temp + (temp.isWhiteSpace ? "" : ",") + "'\(val)'"
        }
        _query = _query + " \(key) IN {\(temp)}"
        return self
    }
    
    public func notEqual(key:String, value:Any) -> QueryOperators{
        return not(equal(key: key, value: value))
    }
    
    public func equal(key:String, value:Any) -> QueryOperators{
        
        _query = _query + "\(key) ==  \((value is String) ?  "'\(value)'" : "\(value)")"
        return self
    }
    
    public func beginsWith(key:String, value:Any) -> QueryOperators{
        _query = _query + " \(key) BEGINSWITH \((value is String) ? "'\(value)'" : "\(value)")"
        return self
    }
    
    public func endsWith(key:String, value:Any) -> QueryOperators{
        _query = _query + " \(key) ENDSWITH \((value is String) ? "'\(value)'" : "\(value)")"
        return self
    }
    
    public func notBeginsWith(key:String, value:Any) -> QueryOperators{
        return not(beginsWith(key: key, value: value))
    }
    
    public func notEndsWith(key:String, value:Any) -> QueryOperators{
        return not(endsWith(key: key, value: value))
    }
    
    public func notContains(key:String, value:Any) -> QueryOperators{
        return not(contains(key: key, value: value))
    }
    
    public func contains(key:String, value:Any) -> QueryOperators{
        _query = _query + " \(key) CONTAINS[c] \((value is String) ? "'\(value)'" : "\(value)")"
        return self
    }
    
    public func notLike(key:String, value:Any) -> QueryOperators{
        return not(like(key: key, value: value))
    }
    
    public func like(key:String, value:Any) -> QueryOperators{
        _query = _query + " \(key) LIKE \((value is String) ? "'\(value)'" : "\(value)")"
        return self
    }
    
    public func any(_ operand:QueryOperators) -> QueryOperators {
        _query = _query + " ANY (\(operand.toString()))"
        return self
    }
    
    public func greaterThan(key:String, value:Any) -> QueryOperators{
        _query = _query + " \(key) > \((value is String) ? "'\(value)'" : "\(value)")"
        return self
    }
    
    public func lessThan(key:String, value:Any) -> QueryOperators{
        _query = _query + " \(key) < \((value is String) ? "'\(value)'" : "\(value)")"
        return self
    }
    
    public func greaterThanOrEqual(key:String, value:Any) -> QueryOperators{
        _query = _query + " \(key) >= \((value is String) ? "'\(value)'" : "\(value)")"
        return self
    }
    
    public func lessThanOrEqual(key:String, value:Any) -> QueryOperators{
        _query = _query + " \(key) <= \((value is String) ? "'\(value)'" : "\(value)")"
        return self
    }
    
    public func notGreaterThan(key:String, value:Any) -> QueryOperators{
        return not(greaterThan(key: key, value: value))
    }
    
    public func notLessThan(key:String, value:Any) -> QueryOperators{
        return not(lessThan(key: key, value: value))
    }
    
    public func notGreaterThanOrEqual(key:String, value:Any) -> QueryOperators{
        return not(greaterThanOrEqual(key: key, value: value))
    }
    
    public func notLessThanOrEqual(key:String, value:Any) -> QueryOperators{
        return not(lessThanOrEqual(key: key, value: value))
    }
    
    public func not(_ operand: QueryOperators) -> QueryOperators {
        _query = _query + " NOT (\(operand.toString()))"
        return self
    }
    
    public func or() -> QueryOperators{
        _query = _query + " OR "
        return self
    }
    
    public func and() -> QueryOperators{
        _query = _query + " AND "
        return self
    }
    
    fileprivate func or(left:QueryOperators, right: QueryOperators) -> QueryOperators{
        _query = _query + " \(left.toString()) OR \(right.toString())"
        return self
    }
    
    fileprivate func and(left:QueryOperators, right:QueryOperators) -> QueryOperators {
        _query = _query + " \(left.toString()) AND \(right.toString())"
        return self
    }
}
