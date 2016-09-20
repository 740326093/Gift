//
//  BaseStrategyFeedController.swift
//  PresentGift
//
//  Created by 金亮齐 on 16/9/18.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//

import UIKit

private let cellReuseIdentifier = "BaseStrategyCell"
class BaseStrategyFeedController: BaseViewController {
    
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
        view.addSubview(tableView)
    }
    
    private func setupUIFrame() {
        tableView.frame = view.bounds
    }
    
    // MARK: - 懒加载
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = Color_GlobalBackground
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.sectionFooterHeight = 0.0001
        tableView.sectionHeaderHeight = 0.0001
        tableView.registerNib(UINib(nibName: "BaseStrategyCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: cellReuseIdentifier)
        return tableView
    }()
}

// MARK: - 代理
extension BaseStrategyFeedController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier)
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 260
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let tabBarViewController = UIApplication.sharedApplication().keyWindow?.rootViewController as! TabbarController
        let navigationController = tabBarViewController.viewControllers![tabBarViewController.selectedIndex] as! NavigationController
        navigationController.pushViewController(CommonStrategyViewController(), animated: true)
    }
    
}
