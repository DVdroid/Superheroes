//
//  HeroOfficialPageViewController.swift
//  VA_SuperHeroes
//
//  Created by Vikash Anand on 30/10/19.
//  Copyright © 2019 Vikash Anand. All rights reserved.
//

import UIKit
import WebKit

class HeroOfficialPageViewController: UIViewController {

    var urlString: String?
    private var webView: WKWebView!
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let acticityIndicatorView = UIActivityIndicatorView()
        acticityIndicatorView.hidesWhenStopped = true
        acticityIndicatorView.style = .large
        acticityIndicatorView.color = UIColor.systemTeal
        acticityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        return acticityIndicatorView
    }()
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let urlString = self.urlString, let url = URL(string: urlString) else { return }
        
        self.view.addSubview(self.activityIndicator)
        NSLayoutConstraint.activate([
            self.activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        self.activityIndicator.startAnimating()
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}

extension HeroOfficialPageViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicator.stopAnimating()
    }
}
