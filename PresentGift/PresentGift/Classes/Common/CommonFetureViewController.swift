//
//  CommonFetureViewController.swift
//  PresentGift
//
//  Created by 金亮齐 on 16/9/18.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//


import UIKit

class CommonFetureViewController: UIViewController {
    
    override func loadView() {
        let classString = String(self.dynamicType)
        NSBundle.mainBundle().loadNibNamed(classString, owner: self, options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
