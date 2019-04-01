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
