import UIKit
class StateStackView: UIStackView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        self.layoutMargins = UIEdgeInsets(top: 32, left: 32, bottom: 32, right: 32)
        self.isLayoutMarginsRelativeArrangement = true
        self.distribution = .fillEqually
        spacing = 32
        self.addArrangedSubview(CountingLabel(startValue: 10, endValue: 100, animationDuration: 1))
        self.addArrangedSubview(CountingLabel(startValue: 10, endValue: 100, animationDuration: 1.2))
        self.addArrangedSubview(CountingLabel(startValue: 0, endValue: 100, animationDuration: 4.5))
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
