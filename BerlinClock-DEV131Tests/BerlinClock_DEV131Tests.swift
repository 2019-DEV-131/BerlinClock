import XCTest
@testable import BerlinClock_DEV131

class BerlinClock_DEV131Tests: XCTestCase {
    
    var sut: BerlinClock!
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        sut = nil
    }
}

// Testing date initialiser
extension BerlinClock_DEV131Tests {
    
    func test_Init_By_Date_Success() {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        guard let date = dateformatter.date(from: "2019/01/05 11:12:13") else {
            XCTAssertFalse(true, "Date conversion failed.")
            return
        }
        guard let clock = BerlinClock(date: date) else {
            XCTAssertFalse(true, "Failed to initialise clock")
            return
        }
        XCTAssertNotNil(clock)
    }
    
    // NOTE: Can add failure test for init. But not sure how to.
}
    
// Testing five hour lamp status
extension BerlinClock_DEV131Tests {
    
    func test_FiveHour_LampState_Counts_00_Hours() {
        sut = BerlinClock(0, 51, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.fiveHourLamps.count, 0)
    }
    
    func test_FiveHour_LampState_Counts_01_Hours() {
        sut = BerlinClock(1, 51, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.fiveHourLamps.count, 0)
    }
    
    func test_FiveHour_LampState_Counts_05_Hours() {
        sut = BerlinClock(5, 51, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.fiveHourLamps.count, 1)
    }
    
    func test_FiveHour_LampState_Counts_16_Hours() {
        sut = BerlinClock(16, 51, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.fiveHourLamps.count, 3)
    }
    
    func test_FiveHour_LampState_Counts_23_Hours() {
        sut = BerlinClock(23, 51, 58)
        
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.fiveHourLamps.count, 4)
    }
    
    func test_FiveHour_LampState_Colors_05_Hours() {
        sut = BerlinClock(5, 51, 58)
        
        let expected: [BerlinClock.LampColor] = [ .red ]
        let lamps = sut.getOutput()
        XCTAssertEqual(lamps.fiveHourLamps, expected)
    }
}

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
