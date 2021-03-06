import UIKit

// Note: Could improve by using MVVM for better separation but for now we should skip it and just focus on the actual UI implementation part
class ClockViewController: UIViewController {

    @IBOutlet weak var digitalTimeLabel: UILabel!
    @IBOutlet weak var secondsLampView: LampColorView!
    @IBOutlet var fiveHourLampViews: [LampColorView]!
    @IBOutlet var singleHourLampViews: [LampColorView]!
    @IBOutlet var fiveMinuteLampViews: [LampColorView]!
    @IBOutlet var singleMinuteLampViews: [LampColorView]!
    
    var clock: BerlinClock!
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clock = BerlinClock(date: Date())
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateLampViews), userInfo: nil, repeats: true)
    }
    
    @objc private func updateLampViews() {
        let date = Date()
        clock = BerlinClock(date: date)
        display(output: clock.getOutput())
    }
    
    private func getDigitalTime() -> String {
        return "\(clock.hours):\(clock.minutes):\(clock.seconds)"
    }
    
    private func reset() {
        secondsLampView.color = nil
        for view in fiveHourLampViews { view.color = nil }
        for view in singleHourLampViews { view.color = nil }
        for view in fiveMinuteLampViews { view.color = nil }
        for view in singleMinuteLampViews { view.color = nil }
    }
    
    private func display(output: BerlinClock.Lamps) {
        reset()
        
        digitalTimeLabel.text = getDigitalTime()
        
        secondsLampView.color = output.secondLamp
        
        for index in 0..<output.fiveHourLamps.count {
            let lampView = fiveHourLampViews[index]
            lampView.color = output.fiveHourLamps[index]
        }
        
        for index in 0..<output.singleHourLamps.count {
            let lampView = singleHourLampViews[index]
            lampView.color = output.singleHourLamps[index]
        }
        
        for index in 0..<output.fiveMinuteLamps.count {
            let lampView = fiveMinuteLampViews[index]
            lampView.color = output.fiveMinuteLamps[index]
        }
        
        for index in 0..<output.singleMinuteLamps.count {
            let lampView = singleMinuteLampViews[index]
            lampView.color = output.singleMinuteLamps[index]
        }
    }
}
