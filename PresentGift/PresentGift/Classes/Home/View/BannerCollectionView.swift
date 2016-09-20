//
//  BannerCollectionView.swift
//  PresentGift
//
//  Created by 金亮齐 on 16/9/19.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let cellReuseIdentifier = "BannerCell"
class BannerCollectionView: UICollectionView {
    
    struct Static {
        static var dispatchOnceToken: dispatch_once_t = 0
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUIFrame()
    }
    
    // MARK: - 视图
    private func setupUI() {
        backgroundColor = Color_GlobalBackground
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        pagingEnabled = true
        delegate = self;
        dataSource = self;
        registerNib(UINib(nibName: "BannerCell", bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
        
        addSubview(pageControl)
    }
    
    private func setupUIFrame() {
        dispatch_once(&Static.dispatchOnceToken) {
            self.pageControl.center.x = self.bounds.width * 0.5;
            self.pageControl.frame.origin.y = self.bounds.height - (12.0 + self.pageControl.bounds.height);
        }
    }
    
    // MARK: - 事件
    
    // MARK: - 懒加载
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.whiteColor()
        pageControl.pageIndicatorTintColor = UIColor(white: 0, alpha: 0.1)
        pageControl.numberOfPages = 4
        return pageControl
    }()
}


// MARK: - 代理
extension BannerCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellReuseIdentifier, forIndexPath: indexPath)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 300.0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let tabBarViewController = UIApplication.sharedApplication().keyWindow?.rootViewController as! TabbarController
        let navigationController = tabBarViewController.viewControllers![tabBarViewController.selectedIndex] as! NavigationController
        navigationController.pushViewController(CommonStrategyViewController(), animated: true)
        print("点击了cell");
    }
    
}

// MARK: - 其他类
extension BannerCollectionView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let contentOffsetX = scrollView.contentOffset.x;
        let page = (contentOffsetX / scrollView.frame.size.width + 0.5) % CGFloat(4)
        pageControl.center.x = contentOffsetX + (ScreenWidth * 0.5)
        pageControl.currentPage = NSInteger(page)
    }
}


class BannerCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.clipsToBounds = true
        photoImageView.contentMode =  UIViewContentMode.ScaleAspectFill;
        photoImageView.image = UIImage(named: "strategy_\(Int(arc4random() % 17) + 1).jpg")
    }
}

class BannerFlowLayout: UICollectionViewFlowLayout {
    
    override func prepareLayout() {
        super.prepareLayout()
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        scrollDirection = UICollectionViewScrollDirection.Horizontal
    }
}

