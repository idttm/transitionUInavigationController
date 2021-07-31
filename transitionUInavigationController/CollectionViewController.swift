//
//  CollectionViewController.swift
//  transitionUInavigationController
//
//  Created by Andrew Cheberyako on 23.07.2021.
//

import UIKit
import Hero

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isHeroEnabled = true
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = .red
    
        cell.heroID = nil
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.visibleCells.forEach { cell in
            cell.heroID = nil
        }
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        cell.heroID = "id"
        let viewController2 = ViewController()
        viewController2.hero.isEnabled = true
        viewController2.view.heroID = "id"
        viewController2.heroModalAnimationType = .zoom
        viewController2.modalPresentationStyle = .fullScreen
//        navigationController?.setViewControllers([viewController2], animated: true)
        
//       navigationController?.pushViewController(viewController2, animated: true)
        
       let nav = UINavigationController(rootViewController: viewController2)
//        present(nav, animated: true, completion: nil)
        
//       self.navigationController?.present(viewController2, animated: true, completion: nil)
       hero.replaceViewController(with: viewController2)
//       navigationController?.pushViewController(viewController2, animated: true)
    }

}


extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 2
        let paddingWidth = 20 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem * 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

