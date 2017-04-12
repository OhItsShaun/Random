import XCTest
@testable import Random

class RandomTests: XCTestCase {
    
    func testSimpleRandom() {
        var values = [Int]()

        for _ in 0..<10 {
            values += [Random.generate()]
        }
        
        var previous = 0
        var same = 0
        for value in values {
            if value == previous {
                same += 1
            }
            previous = value
        }
        if same > 5 {
            XCTFail("Not random enough.")
        }
        
    }
    
    func testMaxRandom() {
        var values = [Int]()
        
        for _ in 0..<100 {
            values += [Random.generate(max: 5)]
        }

        for value in values {
            if value >= 5 {
                XCTFail("Random is not capped by maximum.")
            }
        }
    }


    static var allTests = [
        ("testSimpleRandom", testSimpleRandom),
        ("testMaxRandom", testMaxRandom),
    ]
}
