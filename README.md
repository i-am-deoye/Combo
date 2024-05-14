![Combo: Database Entity collection DSL query.]("https://")

[![Swift](https://img.shields.io/badge/Swift-5.7_5.8_5.9-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.7_5.8_5.9-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-macOS_iOS-Green?style=flat-square)
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)



### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

Once you have your Swift package set up, adding Rumble as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift` or the Package list in Xcode.

```swift
dependencies: [
    .package(url: "https://github.com/i-am-deoye/Combo.git", .upToNextMajor(from: "1.0.0"))
]
```

### Example


```swift
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

class DemoCollections {
    @Query(operators: .init()) private var query
    
    
    func filter(items: [Item], property: String, value: Any) -> [Item] {
        return query.filter(operators: .init().equal(key: property, value: value), items: items)
    }
}

let items: [Item] = [
    .init(name: "A", age: 10),
    .init(name: "B", age: 21),
    .init(name: "C", age: 30),
    .init(name: "D", age: 15),
    .init(name: "E", age: 70)
]

let collections = DemoCollections()

let expectedResult: [Item] = [
    .init(name: "A", age: 10)
]

let result = collections.filter(items: items, property: "name", value: "A")

```
