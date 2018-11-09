import UIKit
import SnapKit
class TableViewCell: UITableViewCell {
    static let cellId = "msgCellId"
    let bubbleView = UIView()
    let messageLabel = UILabel()
    var leftConstraint: Constraint!
    var rightConstraint: Constraint!
    
    var message: Message!{
        didSet{
            
            messageLabel.text = message.text
            bubbleView.backgroundColor = message.isInComig ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.9996673465, green: 0.8927946687, blue: 0.005554047879, alpha: 1)
            if message.isInComig{
                leftConstraint.activate()
                rightConstraint.deactivate()
            }else{
                leftConstraint.deactivate()
                rightConstraint.activate()
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(bubbleView)
        self.addSubview(messageLabel)
        self.backgroundColor = .clear
        self.bubbleView.layer.cornerRadius = 5
        self.bubbleView.layer.masksToBounds = true
        
        messageLabel.numberOfLines = 0
        messageLabel.snp.makeConstraints { (mk) in
            mk.width.lessThanOrEqualTo(200)
            mk.top.equalTo(self).offset(32)
            mk.bottom.equalTo(self).offset(-32)
            self.leftConstraint = mk.left.equalTo(self).offset(32).constraint
            self.rightConstraint = mk.right.equalTo(self).offset(-32).constraint
        }
        bubbleView.snp.makeConstraints { (mk) in
            mk.edges.equalTo(messageLabel).inset(UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
