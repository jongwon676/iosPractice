import UIKit

class PageCell: UICollectionViewCell{
    
    var page: Page?{
        didSet{
            guard let page = page else { return }
            barImageView.image = UIImage(named: page.imageName)
            let attributedText = NSMutableAttributedString(string: page.headerText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n" + page.bodyText, attributes:
                [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),
                 NSAttributedString.Key.foregroundColor : UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    
    
    let barImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "foot"))
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        
        
        
        
        
        
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        
        return textView
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitle("Prev", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitle("Next", for: .normal)
        let pinkColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.setTitleColor(pinkColor, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return pc
    }()
    
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        //        backgroundColor = .yellow
        setupAnchor()
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAnchor(){
        
        let topImageContainerView = UIView()
        
        
        self.addSubview(topImageContainerView)
        topImageContainerView.addSubview(barImageView)
        self.addSubview(descriptionTextView)
        
        barImageView.snp.makeConstraints { (mk) in
            mk.center.equalTo(topImageContainerView)
            mk.height.equalTo(topImageContainerView).multipliedBy(0.5)
            //scaleAspectFit이니 height만 맞춰주면 width는 자동으로 결정된다.
        }
        
        topImageContainerView.snp.makeConstraints { (mk) in
            mk.left.right.top.equalTo(self)
            mk.height.equalTo(self).multipliedBy(0.5)
        }
        
        descriptionTextView.snp.makeConstraints { (mk) in
            mk.bottom.equalTo(self)
            mk.left.equalTo(self).offset(24)
            mk.right.equalTo(self).offset(-24)
            mk.top.equalTo(topImageContainerView.snp.bottom)
        }
    }
    
}
