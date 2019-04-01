import XCTest
@testable import BerlinClock_DEV131

class BerlinClock_DEV131Tests: XCTestCase {
    
    var sut: BerlinClock!
    
    override func setUp() {
        
    }

    override func tearDown() {
        sut = nil
    }
    
    func test_Berlin_Clock_16_50_55() {
        
        sut = BerlinClock(16, 50, 55)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.secondLamp, .none)
        XCTAssertEqual(lamps.fiveHourLamps.count, 3)
        XCTAssertEqual(lamps.singleHourLamps.count, 1)
        XCTAssertEqual(lamps.fiveMinuteLamps.count, 10)
        XCTAssertEqual(lamps.singleMinuteLamps.count, 0)
    }
}
