//
//  PhotoCollectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {
     //MARK: - Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
     //MARK: - ViewLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
        setTheme()
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        let photo = photoController.photos[indexPath.row]
        cell.photo = photo
        
        return cell
    }
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "Dark":
            backgroundColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 1)
            
        case "Blue":
            backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
            
        default:
            break
        }
        collectionView?.backgroundColor = backgroundColor
    }
    
    // MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "SelectTheme":
            guard let destinationVC = segue.destination as? ThemeSelectionViewController else { return }
            destinationVC.photoCollectionVC = self
            destinationVC.themeHelper = themeHelper
            
        case "CreatePhoto":
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            destinationVC.photoController = photoController
            destinationVC.themeHelper = themeHelper
            
        case "ViewPhoto":
            guard let destinationVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
            destinationVC.photo = photoController.photos[indexPath.row]
            destinationVC.photoController = photoController
            destinationVC.themeHelper = themeHelper
            
        default:
            break
        }
    }
}
    //MARK: - DelegateFlowLayout
extension PhotoCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
