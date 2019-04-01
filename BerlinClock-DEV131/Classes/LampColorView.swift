import UIKit

@IBDesignable class LampColorView: UIView {
    
    @IBInspectable var isSecondsView: Bool = false {
        didSet {
            layer.cornerRadius = isSecondsView ? frame.width / 2 : 0
            clipsToBounds = true
        }
    }
    
    var color: BerlinClock.LampColor! {
        didSet {
            guard let color = color else {
                backgroundColor = nil
                return
            }
            
            switch color {
            case .red: backgroundColor = .red
            case .yellow: backgroundColor = .yellow
            case .none: backgroundColor = .clear
            }
        }
    }
    
}
