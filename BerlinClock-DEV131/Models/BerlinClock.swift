import Foundation

class BerlinClock {
    
    private var hours: Int
    private var minutes: Int
    private var seconds: Int
    
    enum Color {
        case red
        case yellow
        case none
    }
    
    struct Lamps {
        var fiveHourLamps: [Color] = []
        var singleHourLamps: [Color] = []
        var fiveMinuteLamps: [Color] = []
        var singleMinuteLamps: [Color] = []
        var secondLamp: Color = .none
    }
    
    init(_ hours: Int, _ minutes: Int, _ seconds: Int) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
    
    func getOutput() -> Lamps {
        var lamp = Lamps()
        return lamp
    }
}
