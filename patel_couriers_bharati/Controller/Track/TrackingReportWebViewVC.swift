//
//  TrackingReportWebViewVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 01/08/23.
//

import UIKit
import WebKit

class TrackingReportWebViewVC: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var btnDownload: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tracking Report "
        webView.navigationDelegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func btnDownloadTap(_ sender: Any) {
    }
    

   

}
