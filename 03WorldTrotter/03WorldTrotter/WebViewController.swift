//
//  WebViewController.swift
//  03WorldTrotter
//
//  Created by Erik Uecke on 4/3/17.
//  Copyright © 2017 Erik Uecke. All rights reserved.
//

import Foundation
import WebKit

class WebViewController: UIViewController, WKUIDelegate{
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://www.bignerdranch.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
}
