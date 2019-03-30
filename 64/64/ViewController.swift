//
//  ViewController.swift
//  64
//
//  Created by 築山朋紀 on 2019/03/30.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import ScalingCarousel

class ScalingCarouselViewCell: ScalingCarouselCell {
    @IBOutlet var imageView: UIImageView!
}

class StoryboardViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var carousel: ScalingCarouselView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carousel.inset = 40
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        carousel.deviceRotated()
    }
}

typealias CarouselDatasource = StoryboardViewController
extension CarouselDatasource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ScalingCarouselViewCell
        cell.imageView.image = UIImage(named: "007_polca")
        DispatchQueue.main.async {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }
        
        return cell
    }
}

typealias CarouselDelegate = StoryboardViewController
extension StoryboardViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //carousel.didScroll()
//        
//        guard let currentCenterIndex = carousel.currentCenterCellIndex?.row else { return }
//        
//        print(currentCenterIndex)
    }
}

private typealias ScalingCarouselFlowDelegate = StoryboardViewController
extension ScalingCarouselFlowDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}
