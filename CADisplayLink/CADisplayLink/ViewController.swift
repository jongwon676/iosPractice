import UIKit

class ViewController: UIViewController {
    
    let label = CountingLabel(startValue: 10, endValue: 100, animationDuration: 2.5)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        let stateStackView = StateStackView(frame: view.frame)
        view.addSubview(stateStackView)
    }
    
}

