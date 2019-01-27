import UIKit
import SnapKit
class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "image"))
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
        addSubview(imageView)
        imageView.snp.makeConstraints { (mk) in
            mk.edges.equalTo(self)
        }
        setupVisualEffectBlur()
    }
    
    var animator: UIViewPropertyAnimator!
    
    
    fileprivate func setupVisualEffectBlur(){
        
        animator = UIViewPropertyAnimator(duration: 3, curve: .linear, animations: { [weak self] in
            guard let `self` = self else { return }
            
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            self.addSubview(visualEffectView)
            visualEffectView.snp.makeConstraints { (mk) in
                mk.edges.equalTo(self)
            }
        })
//        animator.fractionComplete = 0.1
//        animator.startAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
