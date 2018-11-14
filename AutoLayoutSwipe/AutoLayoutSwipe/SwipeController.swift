import UIKit
import Foundation
import SnapKit
class SwipeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "bear_first", headerText: "Join use i nour fun and games!"
            ,bodyText: "Are you ready for loads and loads of fun? Don't wait ant longer! We hope to see you in our stores soon."
        ),
        Page(imageName: "heart_second", headerText:
            "Subscribe and get coupons our daily events",bodyText: "Are you ready for loads and loads of fun? Don't wait ant longer! We hope to see you in our stores soon."
        ),
        Page(imageName: "leaf_third", headerText: "VIP members special service",bodyText: ""
        )
    ]
    
    
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitle("Prev", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitle("Next", for: .normal)
        let pinkColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.setTitleColor(pinkColor, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    @objc func handleNext(){
        pageControl.currentPage = min(pageControl.currentPage + 1,pages.count-1)
        let indexPath = IndexPath(item: pageControl.currentPage,section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    @objc func handlePrev(){
        pageControl.currentPage = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: pageControl.currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return pc
    }()
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        print(x)
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.snp.makeConstraints { (mk) in
            mk.left.right.top.bottom.equalTo(view)
        }
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        setupBottomControls()
        
    }
    
    
    
    
    fileprivate func setupBottomControls(){
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
