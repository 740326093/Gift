//
//  BaseGoodsCell.swift
//  PresentGift
//
//  Created by 金亮齐 on 16/9/18.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class BaseGoodsCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.layer.masksToBounds = true
        photoImageView.contentMode =  UIViewContentMode.ScaleAspectFill;
        photoImageView.image = UIImage(named: "goods_\(Int(arc4random() % 10) + 1).jpg")
    }

}
