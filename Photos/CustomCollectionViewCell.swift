//
//  CustomCollectionViewCell.swift
//  Photos
//
//  Created by Andrea Liu on 4/12/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var photoImage: UIImageView!
    var usernameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let imageFrame = CGRect(x:0, y:18, width: frame.size.width, height: frame.size.height - 18)
        photoImage = UIImageView(frame:imageFrame)
        photoImage.layer.cornerRadius = 10.0
        photoImage.layer.masksToBounds = true
        photoImage.layer.borderWidth = 1
        photoImage.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.contentView.addSubview(photoImage)
        
        let usernameFrame = CGRect(x: 0, y: 0, width: frame.size.width, height: 13)
        usernameLabel = UILabel(frame:usernameFrame)
        usernameLabel.textAlignment = .Center
        usernameLabel.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        usernameLabel.textColor = UIColor.whiteColor()
        usernameLabel.layer.backgroundColor = UIColor.blackColor().CGColor
        usernameLabel.layer.cornerRadius = 10.0
        usernameLabel.layer.masksToBounds = true
        self.contentView.addSubview(usernameLabel)
        
        let borderFrame = CGRect(x:0, y:0, width: frame.size.width, height: frame.size.height)
        let view = UIView(frame: borderFrame)
        //view.layer.borderWidth = 1
        //view.layer.borderColor = UIColor.lightGrayColor().CGColor
        view.layer.cornerRadius = 10.0
        self.contentView.addSubview(view)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}