import UIKit
import SnapKit
struct User{
    
}

class ViewController: UIViewController {
    

    // {} is referred to as closure, or anon, function
    /*
     left : 뷰의 geometry가 어떻게 되든 컨텐츠 본연의 크기 그대로 항상 왼쪽 끝에 컨텐츠를 위치시킨다.
     scaleAspectFill : 컨텐츠 자체의 비율을 유지하여 뷰를 꽉 채운다. 이로 인해 컨텐츠의 일부가 잘려보일 수 있다.
     scaleAspectFit : 컨텐츠 자체의 비율을 유지하며 컨텐츠를 뷰에 온전히 보여주기 위해 맞춘다. 이로 인해 뷰 내부에 빈 공간이 생길 수 있다.
     scaleToFill : 컨텐츠 자체의 비율을 유지하지 않고 뷰 내부를 모두 채우기 위해 컨텐츠를 확대,축소한다. 왜곡 현상이 일어날 수 있다.
     */
    
    let barImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "foot"))
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
//        textView.text = "Join us today in our fun and games!"
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])

        attributedText.append(NSAttributedString(string: "\n\n\n Are you ready for loads and loads of fun? Don't wait any longer! we hope to see you in our stores soon.", attributes:
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),
             NSAttributedString.Key.foregroundColor : UIColor.gray

            ]))


        textView.attributedText = attributedText
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
    
    func setupAnchor(){
        
        let topImageContainerView = UIView()
        
        
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(barImageView)
        view.addSubview(descriptionTextView)
        
        barImageView.snp.makeConstraints { (mk) in
            mk.center.equalTo(topImageContainerView)
            mk.height.equalTo(topImageContainerView).multipliedBy(0.5)
            //scaleAspectFit이니 height만 맞춰주면 width는 자동으로 결정된다.
        }
        
        topImageContainerView.snp.makeConstraints { (mk) in
            mk.left.right.top.equalTo(view)
            mk.height.equalTo(view).multipliedBy(0.5)
        }
        
        descriptionTextView.snp.makeConstraints { (mk) in
            mk.bottom.equalTo(view)
            mk.left.equalTo(view).offset(24)
            mk.right.equalTo(view).offset(-24)
            mk.top.equalTo(topImageContainerView.snp.bottom)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnchor()
        setupBottomControls()
        
    }
    fileprivate func setupBottomControls(){
//        view.addSubview(previousButton)
//        previousButton.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
//        previousButton.backgroundColor = .red

        
        
        
        
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        bottomControlsStackView.distribution = .fillEqually
        bottomControlsStackView.axis = .horizontal
        
        
        
        view.addSubview(bottomControlsStackView)
        
        bottomControlsStackView.snp.makeConstraints { (mk) in
            mk.left.right.equalTo(view.safeAreaLayoutGuide)
            mk.height.equalTo(50)
            
            mk.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
}

