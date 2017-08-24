//
//  ViewController.swift
//  Blockhead
//
//  Created by David Oliver Doswell on 8/23/17.
//  Copyright © 2017 David Oliver Doswell. All rights reserved.
//

import UIKit

private let satNumber = "TEL://15182558463"
private let reuseIdentifier = "reuseIdentifier"

class ViewController: UIViewController {
    
    // MARK: - Initialize Collection View
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let viewController = UICollectionView(frame: .zero, collectionViewLayout: layout)
        viewController.backgroundColor = .white
        viewController.alwaysBounceVertical = true
        viewController.allowsMultipleSelection = true
        viewController.showsVerticalScrollIndicator = false
        return viewController
    }()
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpCollectionView()
        self.title = "Home"
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BlockCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    func setUpCollectionView() {
        view.addSubview(collectionView)
        collectionView.frame = view.frame
    }
}

// MARK: - Data Source
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // TODO: Get array of unique blocks / data from Network via Bitcoin Fibre
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BlockCell
        
        cell.backgroundColor = .white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 3.0
        cell.layer.cornerRadius = 20
        
        cell.getBlockButton.addTarget(self, action: #selector(getBlockTap(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    // MARK: - Call Satellite
    
    func getBlockTap(sender: UIButton) {
        let url = URL(string: satNumber)! as URL
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

// MARK: - Collection View Size
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 325, height: 375)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 30
    }
}
