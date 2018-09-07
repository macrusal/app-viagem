//
//  DetalheHoteisViewController.swift
//  Viagens & Turismo
//
//  Created by Marcelo on 07/09/2018.
//  Copyright © 2018 Hibejix. All rights reserved.
//

import UIKit
import WebKit

class DetalheHoteisViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var large: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        abrirPagina()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func abrirPagina() {
        let usrString = "https://www.google.com.br"
        let url = URL(string: usrString)!;
        let request = URLRequest(url: url)
        webview.allowsBackForwardNavigationGestures = true;
        webview.allowsLinkPreview = true;
        webview.navigationDelegate = self;
        webview.uiDelegate = self;
        webview.load(request);
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        large.stopAnimating();
    }

}
