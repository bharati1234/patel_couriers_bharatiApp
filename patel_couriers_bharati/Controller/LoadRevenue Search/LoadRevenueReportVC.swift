//
//  LoadRevenueReportVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 27/07/23.
//

import UIKit
import WebKit

class LoadRevenueReportVC: UIViewController,WKNavigationDelegate{
    
    @IBOutlet weak var btnDownload: UIBarButtonItem!
    @IBOutlet weak var webView: WKWebView!
    
    var loadRevenueReportDataArray = [LoadRevenueReportData]()
    var loadRevenueReportWebViewArray = [LoadRevenueReportWebView]()
    
    var serviceId = "", servicename = "", productId = "", productname = "" , paymentmodeid = "", paymentmode = "",consignorId = "",consignorName = "",
        branchId = "", branchName = "", carrierId = "", desc = "", divisionId = "", regionId = "", areaId = "", opBranchId = "" ,fromDate = "",
        toDate = "",  destinationId = "", userId = "", valueRadio = "" , groupCriteria = "" , userCurrentBranchId = ""
    
    var downloadParameters = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Load Revenue Report"
        webView.navigationDelegate = self
        webView.scrollView.setZoomScale(5, animated: true)
        LoadingOverlay.shared.showOverlay()
        
        API_getloadRevenueListData()
    }
    func API_getloadRevenueListData(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        
        parameters["serviceId"] = (serviceId != "") ? serviceId : "0"
        parameters["servicename"] = (servicename != "") ? servicename : "null"
        parameters["productId"] = (productId != "") ? productId : "0"
        parameters["productname"] = (productname != "") ? productname : "null"
        parameters["paymentmodeid"] = (paymentmodeid != "") ? paymentmodeid : "0"
        parameters["paymentmode"] = (paymentmode != "") ? paymentmode : "null"
        parameters["consignorId"] = (consignorId != "") ? consignorId : "0"
        parameters["consignorName"] = (consignorName != "") ? consignorName : "null"
        parameters["branchId"] = (branchId != "") ? branchId : "0"
        parameters["branchName"] = (branchName != "") ? branchName : ""
        parameters["carrierId"] = (carrierId != "") ? carrierId : "0"
        parameters["description"] = (desc != "") ? desc : "null" // unknown
        parameters["divisionId"] =  (divisionId != "") ? divisionId : "0"
        parameters["regionId"] = (regionId != "") ? regionId : "0"
        parameters["areaId"] = (areaId != "") ? areaId : "0"
        parameters["opBranchId"] = (opBranchId != "") ? opBranchId : "0"
        parameters["destinationId"] = (destinationId != "") ? destinationId : "0"
        parameters["fromDate"] = fromDate
        parameters["toDate"] = toDate
        parameters["userId"] = 61
        parameters["valueRadio"] = (valueRadio != "") ? valueRadio : "1" // valueRadio  = GroupCriteria
        parameters["groupCriteria"] = (groupCriteria != "") ? groupCriteria : "1"  // groupCriteria = Report Criteria Load Revenue or only Load
        parameters["userCurrentBranchId"] = 29 // unkonwn
        
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.LOADREVENUE_REPORT, parameters: parameters ){ data in
            
            // LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            
            if result{
                let response = json["response"]
                let reportOutput = response["reportOutput"]
                self.loadRevenueReportDataArray.append(LoadRevenueReportData(json: reportOutput))
                //self.webView.loadHTMLString(reportOutput.stringValue, baseURL: nil)
                self.downloadParameters = response["downloadParameters"].stringValue
                self.API_getloadRevenueReportWebView()
            }else{
                let reason: String = json["message"].stringValue
                self.popupAlert(title: nil, message: reason, actions: nil)
            }
            
        }
    }
    @IBAction func btnDownloadTap(_ sender: Any) {
    }
    func API_getloadRevenueReportWebView(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        //LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        
        let url = MyConfig.LOADREVENUE_REPORT_WEBVIEW + "?parameter=\(downloadParameters)"
        
        URL_Session.shared.getData(viewController: self, url: url, parameters: parameters ){ data in
            
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            
            if result {
                let response = json["response"]
                self.loadRevenueReportWebViewArray.append(LoadRevenueReportWebView(json: response))
                
                let downloadFilePath = response["downloadFilePath"].stringValue
                /// Fetch PDF data from the server using the downloadFilePath
                guard let pdfURL = URL(string: downloadFilePath) else {
                    self.popupAlert(title: nil, message: "Invalid PDF URL", actions: nil)
                    return
                }
                let request = URLRequest(url: pdfURL)
                self.webView.load(request)
                
            } else {
                let reason: String = "Record(s) not found for selected search criteria."
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
