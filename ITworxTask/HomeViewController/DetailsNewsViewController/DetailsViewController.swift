//
//  DetailsViewController.swift
//  ITworxTask
//
//  Created by John Doe on 2022-01-09.
//

import UIKit
import WebKit
class DetailsViewController: UIViewController, WKNavigationDelegate {
    
    
    var link: String?
    var webView: WKWebView!
    var newsSource: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = newsSource
        
        
        guard let url = URL(string: link ?? ""  ) else{ let alert = UIAlertController(title: "Alert", message: "There's no link to show here", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { alert in
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
            return
            
        }
    
        webView.load(URLRequest(url: url ?? URL(string: "")!))
        webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }

}

