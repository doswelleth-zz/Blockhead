//
//  BlockCell.swift
//  Blockhead
//
//  Created by David Oliver Doswell on 8/23/17.
//  Copyright © 2017 David Oliver Doswell. All rights reserved.
//

import UIKit

private let blockTitleButton = "Get Block"

class BlockCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Outlets
    
    let getBlockButton : UIButton = {
        let button = UIButton(type: .system) as UIButton
        button.setTitle(blockTitleButton, for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Cell Constraints
    
    func setUpViews() {
        
        addSubview(getBlockButton)
        backgroundColor = .blue
        
        let margin = layoutMarginsGuide
        
        // Call Button Constraints
        
        addConstraints([NSLayoutConstraint(item: getBlockButton, attribute: .centerX, relatedBy: .equal, toItem: margin, attribute: .centerX, multiplier: 1, constant: 0)])
        
        addConstraints([NSLayoutConstraint(item: getBlockButton, attribute: .centerY, relatedBy: .equal, toItem: margin, attribute: .centerY, multiplier: 1, constant: 0)])
        
        addConstraints([NSLayoutConstraint(item: getBlockButton, attribute: .top, relatedBy: .equal, toItem: margin, attribute: .topMargin, multiplier: 1, constant: 300)])
        
        addConstraints([NSLayoutConstraint(item: getBlockButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)])
        
        addConstraints([NSLayoutConstraint(item: getBlockButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)])
    }
}

// MARK: - Get Data from Bitcoin Network by Bitcoin Fibre
class Blockhead {
    let info = "At current height \(Blockheight.init().height), the block hash is \(Blockhash.init().hash)"
}

class Blockheight {
    let height = "481688"
}

class Blockhash {
    let hash = "00000000000000000087b2d29b3365b87eb65cd02c7fb5e00b36bda1fa99f89b"
}
