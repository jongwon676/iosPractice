import UIKit

extension SwipeController{
    
    override func viewWillTransition(to size: CGSize, with coordinator:
        UIViewControllerTransitionCoordinator) {
        self.collectionView.reloadData()
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
            
            /*
                If you call invalidateLayout() your layout is updated as soon as the next layout update cycle occurs. If you call invalidateLayout() and then layoutIfNeeded() the layout will be updated immediately. If you just call layoutIfNeeded() and the layout is still valid, nothing will happen.
            */
        }) { (bear) in
            
        }
    }
}
