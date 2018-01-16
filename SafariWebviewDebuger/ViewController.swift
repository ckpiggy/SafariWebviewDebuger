//
//  ViewController.swift
//  SafariWebviewDebuger
//
//  Created by ChangChao-Tang on 2018/1/16.
//  Copyright © 2018年 ChangChao-Tang. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    let webView = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
    let input = UITextField()
    let load = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.white
        view.addSubview(webView)
        webView.navigationDelegate = self
        let width:CGFloat = view.bounds.width
        let height:CGFloat = 500
        webView.frame = CGRect(x: 0, y: view.bounds.maxY - height, width: width, height: height)
        
        view.addSubview(input)
        input.frame = CGRect(x: 5, y: 20, width: 280, height: 40)
        input.placeholder = "input url here..."
        input.keyboardType = .URL
        input.autocapitalizationType = .none
        input.autocorrectionType = .no
        
        view.addSubview(load)
        load.frame = CGRect(x: input.frame.maxX, y: input.frame.minY, width: 40, height: 40)
        load.setTitleColor(UIColor.black, for: .normal)
        load.setTitle("Load", for: .normal)
        load.addTarget(self, action: #selector(onLoad), for: .touchUpInside)
    }
    
    @objc func onLoad() {
        resignFirstResponder()
        guard let urlString = input.text, let url = URL(string: urlString) else {
            return
        }
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
        webView.load(request)
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("\(error)")
    }
}
