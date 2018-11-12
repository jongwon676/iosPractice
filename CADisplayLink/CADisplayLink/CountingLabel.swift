import UIKit
class CountingLabel: UILabel{
    
    let startValue: Int
    let endValue: Int
    let animationDuration:Double
    let animationStart: Date = Date()
    var displayLink: CADisplayLink?
    
    init(startValue:Int,endValue:Int,animationDuration:Double) {
        self.startValue = startValue
        self.endValue = endValue
        self.animationDuration = animationDuration
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
        text = String(startValue)
        font = UIFont.boldSystemFont(ofSize: 18)
        textAlignment = .center
        
        displayLink = CADisplayLink(target: self, selector: #selector(handleCounting))
        
        displayLink?.add(to: .main, forMode: .default)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleCounting(){
        let diff = Date().timeIntervalSince(animationStart)
        if diff > animationDuration{
            self.text = String(endValue)
        }else{
            let percentage = diff / animationDuration
            let currentValue = Double(endValue - startValue) * percentage
            self.text = String(Int(currentValue))
        }
    }
}
