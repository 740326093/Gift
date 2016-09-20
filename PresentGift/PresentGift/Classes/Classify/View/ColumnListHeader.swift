//
//  ColumnListHeader.swift
//  PresentGift
//
//  Created by 金亮齐 on 16/9/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class ColumnListHeader: UIView {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photoImageView.clipsToBounds = true
        photoImageView.contentMode =  UIViewContentMode.ScaleAspectFill;
        photoImageView.image = UIImage(named: "strategy_\(Int(arc4random() % 17) + 1).jpg")
    }
    
    class func columnListHeader() -> ColumnListHeader{
        return NSBundle.mainBundle().loadNibNamed("ColumnListHeader", owner: nil, options: nil)!.last as! ColumnListHeader
    }


}
