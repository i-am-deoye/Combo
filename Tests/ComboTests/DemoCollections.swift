//
//  File.swift
//  
//
//  Created by 13402598 on 09/05/2024.
//

import Foundation
@testable import Combo



class Item: NSObject, Query.QueryItemType {
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
    
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Index: NSObject, Query.QueryItemType {
    
}




class DemoCollections {
    @Query(operators: .init()) private var query
    
    
    func filter(items: [Item], property: String, value: Any) -> [Item] {
        return query.filter(operators: .init().equal(key: property, value: value), items: items)
    }
}
