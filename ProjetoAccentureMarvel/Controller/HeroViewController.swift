//
//  HeroViewController.swift
//  ProjetoAccentureMarvel
//
//  Created by Renato Savoia Girão on 14/04/2018.
//  Copyright © 2018 Renato Savoia Girão. All rights reserved.
//

import UIKit
import WebKit

class HeroViewController: UIViewController {
    
    //Essa View foi criada para exibir uma WebView, porém foi verificado que a URL da Marvel está desatualizada para o novo iOS e, portanto, o CSS não era carregado na webView, assim, a página ficava um tanto quanto pobre em detalhes.
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var hero : Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: hero.urls.first!.url)
        let request = URLRequest(url: url!)
        title = hero.name
        
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        webView.load(request)
        
    }
    
}

//MARK: Extension para a classe HeroVC possa implementar o protocolo WebKitNavigationDelegate
extension HeroViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
        
    }
}
