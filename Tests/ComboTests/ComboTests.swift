import XCTest
@testable import Combo

final class ComboTests: XCTestCase {

    
    
    
    func test_filter_items() throws {
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
        
        XCTAssertEqual(expectedResult.first!.age, result.first!.age)
        XCTAssertEqual(expectedResult.first!.name, result.first!.name)
    }
}
