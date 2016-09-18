//
//  WebViewController.swift
//  PresentGift
//
//  Created by 金亮齐 on 16/9/18.
//  Copyright © 2016年 醉看红尘这场梦. All rights reserved.
//
import UIKit
import SVProgressHUD
class WebViewController: UIViewController {
    
    var url: NSString? {
        didSet{
        SVProgressHUD.showWithMaskType(SVProgressHUDMaskType.None)
            webView.loadRequest(NSURLRequest(URL: NSURL(string: url! as String)!))
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        SVProgressHUD.dismiss()
    }
    
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
        view.addSubview(webView)
    }
    
    private func setupUIFrame() {
        webView.frame = view.bounds
    }
    
    // MARK: - 懒加载
    private lazy var webView: UIWebView = {
        let webView = UIWebView()
        webView.delegate = self
        return webView
    }()
}

extension WebViewController:UIWebViewDelegate {
    
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        SVProgressHUD.dismiss()
    }
}
