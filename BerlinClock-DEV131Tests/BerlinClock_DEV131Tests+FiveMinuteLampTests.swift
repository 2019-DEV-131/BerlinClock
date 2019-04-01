import XCTest
@testable import BerlinClock_DEV131

// Testing five minute lamp status
extension BerlinClock_DEV131Tests {
    
    func test_FiveMinute_LampState_Counts_00_Minutes() {
        sut = BerlinClock(16, 0, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.fiveMinuteLamps.count, 0)
    }
    
    func test_FiveMinute_LampState_Counts_04_Minutes() {
        sut = BerlinClock(16, 4, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.fiveMinuteLamps.count, 0)
    }
    
    func test_FiveMinute_LampState_Counts_23_Minutes() {
        sut = BerlinClock(16, 23, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.fiveMinuteLamps.count, 4)
    }
    
    func test_FiveMinute_LampState_Counts_51_Minutes() {
        sut = BerlinClock(16, 51, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.fiveMinuteLamps.count, 10)
    }
    
    func test_FiveMinute_LampState_Colors_51_Minutes() {
        sut = BerlinClock(16, 51, 58)
        
        let expected: [BerlinClock.LampColor] = [ .yellow, .yellow, .red, .yellow, .yellow, .red, .yellow, .yellow, .red, .yellow ]
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.fiveMinuteLamps, expected)
    }
    
}
