//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
     //MARK: - ViewLoad
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setSubViews()
    }
    
    @objc func selectDarkTheme() {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true) {
            DispatchQueue.main.async {
                self.photoCollectionVC?.setTheme()
            }
        }
    }
    
    @objc func selectBlueTheme() {
        themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true) {
            DispatchQueue.main.async {
                self.photoCollectionVC?.setTheme()
            }
        }
    }
    
     //MARK: - Properties
    var themeHelper: ThemeHelper?
    var photoCollectionVC: PhotoCollectionViewController?
    
    func setSubViews() {
         //MARK: - PhotoLabel
        let photoCollectionLabel = UILabel()
        photoCollectionLabel.translatesAutoresizingMaskIntoConstraints = false
        photoCollectionLabel.text = "Photo Collection"
        photoCollectionLabel.font = UIFont(name: "Avenir-Heavy", size: 40)
        photoCollectionLabel.textAlignment = .center

        view.addSubview(photoCollectionLabel)

        photoCollectionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        photoCollectionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        photoCollectionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        
         //MARK: - WhichThemeLabel
        let whichThemeLabel = UILabel()
        whichThemeLabel.translatesAutoresizingMaskIntoConstraints = false
        whichThemeLabel.font = UIFont(name: "Avenir-Medium", size: 15)
        whichThemeLabel.text = "Select the theme you would like to use:"
        whichThemeLabel.textAlignment = .center

        view.addSubview(whichThemeLabel)

        whichThemeLabel.topAnchor.constraint(equalTo: photoCollectionLabel.bottomAnchor, constant: 10).isActive = true
        whichThemeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        whichThemeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
        
         //MARK: - DarkButton
        let darkButton = UIButton()
        darkButton.translatesAutoresizingMaskIntoConstraints = false
        darkButton.setTitle("Dark", for: .normal)
        darkButton.setTitleColor(.systemBlue, for: .normal)
        darkButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 20)

        darkButton.addTarget(self, action: #selector(selectDarkTheme), for: .touchUpInside)

         //MARK: - LightButton
        let lightButton = UIButton()
        lightButton.translatesAutoresizingMaskIntoConstraints = false
        lightButton.setTitle("Blue", for: .normal)
        lightButton.setTitleColor(.systemBlue, for: .normal)
        lightButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 20)

        lightButton.addTarget(self, action: #selector(selectBlueTheme), for: .touchUpInside)
        
         //MARK: - StackView
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill

        stackView.addArrangedSubview(darkButton)
        stackView.addArrangedSubview(lightButton)

        view.addSubview(stackView)

        stackView.topAnchor.constraint(equalTo: whichThemeLabel.bottomAnchor, constant: 40).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 120).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -120).isActive = true
    }
}
