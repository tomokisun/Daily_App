//
//  ViewController.swift
//  64
//
//  Created by 築山朋紀 on 2019/03/30.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import ScalingCarousel

class MusicModel {
    let image: UIImage?
    let title: String
    let name: String
    
    init(image: UIImage?, title: String, name: String) {
        self.image = image
        self.title = title
        self.name = name
    }
}

class ScalingCarouselViewCell: ScalingCarouselCell {
    @IBOutlet var imageView: UIImageView!
}

class StoryboardViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var carousel: ScalingCarouselView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    
    private var musicModel = [MusicModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicModel.append(MusicModel(image: UIImage(named: "001_iri"), title: "Shade", name: "iri"))
        musicModel.append(MusicModel(image: UIImage(named: "002_ame"), title: "Change your pops", name: "ame_no_parade"))
        musicModel.append(MusicModel(image: UIImage(named: "003_ame"), title: "stage ", name: "ame_no_parade"))
        musicModel.append(MusicModel(image: UIImage(named: "004_sakana"), title: "ユリイカ", name: "サカナクション"))
        musicModel.append(MusicModel(image: UIImage(named: "005_tempalay"), title: "革命前夜", name: "Tempalay"))
        musicModel.append(MusicModel(image: UIImage(named: "006_sakana"), title: "Sakanaction", name: "サカナクション"))
        musicModel.append(MusicModel(image: UIImage(named: "007_polca"), title: "全知全能", name: "ポルカドットスティングレイ"))
        
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
        return musicModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ScalingCarouselViewCell
        cell.imageView.image = musicModel[indexPath.row].image
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
        guard let currentCenterIndex = carousel.currentCenterCellIndex?.row else { return }
        titleLabel.text = musicModel[currentCenterIndex].title
        nameLabel.text = musicModel[currentCenterIndex].name
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
