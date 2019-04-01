import XCTest
@testable import BerlinClock_DEV131

// Testing second lamp status
extension BerlinClock_DEV131Tests {
    
    func test_Second_LampState_Counts_00_Seconds() {
        sut = BerlinClock(16, 51, 0)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.secondLamp, .red)
    }
    
    func test_Second_LampState_Counts_01_Seconds() {
        sut = BerlinClock(16, 51, 1)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.secondLamp, .none)
    }
    
    func test_Second_LampState_Counts_30_Seconds() {
        sut = BerlinClock(16, 51, 30)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.secondLamp, .red)
    }
    
    func test_Second_LampState_Counts_58_Seconds() {
        sut = BerlinClock(16, 51, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.secondLamp, .red)
    }
    
    func test_Second_LampState_Counts_59_Seconds() {
        sut = BerlinClock(16, 51, 59)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.secondLamp, .none)
    }
}
