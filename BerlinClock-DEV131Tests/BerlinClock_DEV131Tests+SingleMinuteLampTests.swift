import XCTest
@testable import BerlinClock_DEV131

// Testing single minute lamp status
extension BerlinClock_DEV131Tests {
    
    func test_SingleMinute_LampState_Counts_00_Minutes() {
        sut = BerlinClock(16, 00, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.singleMinuteLamps.count, 0)
    }
    
    func test_SingleMinute_LampState_Counts_32_Minutes() {
        sut = BerlinClock(16, 32, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.singleMinuteLamps.count, 2)
    }
    
    func test_SingleMinute_LampState_Counts_35_Minutes() {
        sut = BerlinClock(16, 35, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.singleMinuteLamps.count, 0)
    }
    
    func test_SingleMinute_LampState_Counts_59_Minutes() {
        sut = BerlinClock(16, 59, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.singleMinuteLamps.count, 4)
    }
    
    func test_SingleMinute_LampState_Colors_51_Minutes() {
        sut = BerlinClock(16, 51, 58)
        
        let expected: [BerlinClock.LampColor] = [ .yellow ]
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.singleMinuteLamps, expected)
    }
    
}
