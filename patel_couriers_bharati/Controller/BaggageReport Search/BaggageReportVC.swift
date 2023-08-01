//
//  BaggageReportVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 25/07/23.
//

import UIKit
import WebKit

class BaggageReportVC: UIViewController ,WKNavigationDelegate{
    
    
    @IBOutlet weak var webView: WKWebView!

    @IBOutlet weak var btnDownload: UIBarButtonItem!
    var baggageReportDataArray = [BaggageReportData]()
    var pnBrnumber = ""
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Baggage Report "
        webView.navigationDelegate = self
        webView.scrollView.setZoomScale(5, animated: true)
        LoadingOverlay.shared.showOverlay()
       
        API_getBaggageReportData()
    }
    
    @IBAction func btnDownloadTap(_ sender: Any) {
    }
    
    func API_getBaggageReportData(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        parameters["bagageRptNo"] = pnBrnumber
        parameters["opBranchId"] = 46
       
        URL_Session.shared.postData(viewController: self, url: MyConfig.BAGGAGE_REPORT, parameters: parameters ){ data in
            
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            
            if result{
                let response = json["response"]
                let reportOutput = response["reportOutput"]
             
                self.baggageReportDataArray.append(BaggageReportData(json: reportOutput))
                self.webView.loadHTMLString(reportOutput.stringValue, baseURL: nil)
            }else{
                let reason: String = json["message"].stringValue
                self.popupAlert(title: nil, message: reason, actions: nil)
            }
           
        }
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
           print("Start to load")
       }
       func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
           LoadingOverlay.shared.hideOverlayView()
       }
       func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
           print(error.localizedDescription)
       }

}
