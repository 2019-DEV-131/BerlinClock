import XCTest
@testable import BerlinClock_DEV131

// Testing single hour lamp status
extension BerlinClock_DEV131Tests {
    
    func test_SingleHour_LampState_Counts_00_Hours() {
        sut = BerlinClock(0, 51, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.singleHourLamps.count, 0)
    }
    
    func test_SingleHour_LampState_Counts_01_Hours() {
        sut = BerlinClock(1, 51, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.singleHourLamps.count, 1)
    }
    
    func test_SingleHour_LampState_Counts_16_Hours() {
        sut = BerlinClock(16, 51, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.singleHourLamps.count, 1)
    }
    
    func test_SingleHour_LampState_Counts_23_Hours() {
        sut = BerlinClock(23, 51, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.singleHourLamps.count, 3)
    }
    
    func test_SingleHour_LampState_Colors_23_Hours() {
        sut = BerlinClock(23, 51, 58)
        
        let expected: [BerlinClock.LampColor] = [ .red, .red, .red ]
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.singleHourLamps, expected)
    }
    
}
