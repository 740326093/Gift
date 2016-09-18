//
//  SearchGifViewController.swift
//  PresentGift
//
//  Created by 金亮齐 on 16/9/18.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

class SearchGifViewController: BaseGoodsFeedViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUIFrame()
    }
    
    // MARK: - 视图
    private func setupUI() {
        title = "选礼神器"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        view.backgroundColor = Color_GlobalBackground
        view.addSubview(popoverSortGifView)
        view.addSubview(popoverSortView)
    }
    
    private func setupUIFrame() {
        let height:CGFloat = 44.0
        popoverSortGifView.frame = CGRect(origin: CGPointZero, size: CGSizeMake(view.bounds.width, height))
        collectionView.frame.origin.y = height
        collectionView.frame.size.height = view.bounds.height - height
    }
    
    // MARK: - 事件
    @objc private func rightBtnAction() {
        /// 弹出刷选视图
        if popoverSortView.hidden {
            popoverSortView.show()
        } else {
            popoverSortView.hide()
        }
    }
    
    // MARK: - 懒加载
    private lazy var popoverSortGifView: PopoverSortGifView = PopoverSortGifView.popoverSortGifView()
    
    private lazy var rightBtn: UIButton = UIButton(sortTarget: self, action: #selector(SearchGifViewController.rightBtnAction))
    
    private lazy var popoverSortView = PopoverSortView(frame: CGRect(x: ScreenWidth - 155, y: 0, width: 155, height: 190))


}
