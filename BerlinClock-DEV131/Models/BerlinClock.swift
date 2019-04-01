import Foundation

class BerlinClock {
    
    private var hours: Int
    private var minutes: Int
    private var seconds: Int
    
    enum LampColor {
        case red
        case yellow
        case none
    }
    
    struct Lamps {
        var fiveHourLamps: [LampColor] = []
        var singleHourLamps: [LampColor] = []
        var fiveMinuteLamps: [LampColor] = []
        var singleMinuteLamps: [LampColor] = []
        var secondLamp: LampColor = .none
    }
    
    init?(date: Date) {
        let components: Set<Calendar.Component> = [ .year, .month, .day, .hour, .minute, .second ]
        let datecomponents = Calendar.current.dateComponents(components, from: date)
        
        guard let hours = datecomponents.hour, let minutes = datecomponents.minute, let seconds = datecomponents.second else {
            // Not sure if this would ever execute but good to take precautions
            return nil
        }
        
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
    
    init(_ hours: Int, _ minutes: Int, _ seconds: Int) {
        self.hours = hours
        self.minutes = minutes
        self.seconds = seconds
    }
    
    func getOutput() -> Lamps {
        var lamp = Lamps()
        
        let fiveHourLampsCount = self.hours / 5
        for _ in 0..<fiveHourLampsCount {
            lamp.fiveHourLamps.append(.red)
        }
        
        let singleHourLampsCount = self.hours % 5
        for _ in 0..<singleHourLampsCount {
            lamp.singleHourLamps.append(.red)
        }
        
        let fiveMinutesLampsCount = self.minutes / 5
        for index in 0..<fiveMinutesLampsCount {
            if index != 0, (index + 1) % 3 == 0 {
                lamp.fiveMinuteLamps.append(.red)
            } else {
                lamp.fiveMinuteLamps.append(.yellow)
            }
        }
        
        let singleMinutesLampsCount = self.minutes % 5
        for _ in 0..<singleMinutesLampsCount {
            lamp.singleMinuteLamps.append(.yellow)
        }
        
        lamp.secondLamp = (self.seconds % 2 == 0) ? .red : .none
        
        return lamp
    }
}
