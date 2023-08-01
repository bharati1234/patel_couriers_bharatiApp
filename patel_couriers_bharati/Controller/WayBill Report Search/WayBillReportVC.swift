//
//  WayBillReportVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 27/07/23.
//

import UIKit
import WebKit

class WayBillReportVC: UIViewController,WKNavigationDelegate{
    @IBOutlet weak var btnDownload: UIBarButtonItem!
    @IBOutlet weak var webView: WKWebView!
    
    var wayBillReportDataArray = [WayBillReportData]()
    var wayBillReportDataWebviewArray = [WayBillReportDataWebView]()
    
    var sort = "", reportType = "", divisionId = "", regionId = "", areaId = "", branchId = "", opBranchId = "" ,serviceId = "", productId = "",
        payTypeId = "", consignorId = "", destinationId = "", routeId = "", fromDate = "", toDate = "", originId = "", rateCategoryId = "",
        statusId = "",typeId = "", searchOn = "", userId = "", groupId = "", fromWaybill = "", toWaybill = "",opBrachName = "",
        valueRadio = "" ,reportCriteria = "", groupConsignor = ""
    
    var downloadParameters = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "WayBill Report"
        webView.navigationDelegate = self
        webView.scrollView.setZoomScale(5, animated: true)
        LoadingOverlay.shared.showOverlay()
       
        API_getwayBillListData()
    }
    func API_getwayBillListData(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        
        parameters["sort"] = "WBNO"//(sort != "") ? sort : "" // In option array string is WayBillNo
        parameters["reportType"] = "Branch" //(reportType != "") ? reportType : ""
        parameters["divisionId"] =  (divisionId != "") ? divisionId : "0" //7
        parameters["regionId"] = (regionId != "") ? regionId : "0"  //22
        parameters["areaId"] =  (areaId != "") ? areaId : "0" //18
        parameters["branchId"] = 29 // constant
        parameters["opBranchId"] = 46 // constant
        parameters["serviceId"] = (serviceId != "") ? serviceId : "0"
        parameters["productId"] = (productId != "") ? productId : "0"
        parameters["payTypeId"] = (payTypeId != "") ? payTypeId : "0"
        parameters["consignorId"] = (consignorId != "") ? consignorId : "0"
        parameters["destinationId"] = (destinationId != "") ? destinationId : "0"
        parameters["routeId"] = (routeId != "") ? routeId : "0"
        parameters["fromDate"] = fromDate
        parameters["toDate"] = toDate
        parameters["originId"] = 46
        parameters["rateCategoryId"] = (rateCategoryId != "") ? rateCategoryId : "0"
        parameters["statusId"] = (statusId != "") ? statusId : "0"
        parameters["typeId"] = (typeId != "") ? typeId : "0"
        parameters["searchOn"] = (searchOn != "") ? searchOn : "0"
        parameters["userId"] = 61
        parameters["groupId"] = (groupId != "") ? groupId : "0"
        parameters["fromWaybill"] = (fromWaybill != "") ? fromWaybill : ""
        parameters["toWaybill"] = (toWaybill != "") ? toWaybill : ""
        parameters["opBrachName"] = (opBrachName != "") ? opBrachName : ""
        parameters["valueRadio"] = 1 // unknown parameter
        parameters["reportCriteria"] = 1 // unknown prameter
        parameters["groupConsignor"] = 1
      
        URL_Session.shared.postData(viewController: self, url: MyConfig.WAYBILL_REPORT, parameters: parameters ){ data in
            
           // LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            
            if result{
                let response = json["response"]
                let reportOutput = response["reportOutput"]
                self.wayBillReportDataArray.append(WayBillReportData(json: reportOutput))
                self.webView.loadHTMLString(reportOutput.stringValue, baseURL: nil)
                self.downloadParameters = response["downloadParameters"].stringValue
                self.API_getWayBillReportWebView()
            }else{
                let reason: String = json["message"].stringValue
                self.popupAlert(title: nil, message: reason, actions: nil)
            }
           
        }
    }
    @IBAction func btnDownloadTap(_ sender: Any) {
    }
    func API_getWayBillReportWebView(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        //LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
 
        let url = MyConfig.WAYBILL_REPORT_WEBVIEW + "?parameter=\(downloadParameters)"
        
        URL_Session.shared.postData(viewController: self, url: url, parameters: parameters ){ data in
            
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            
            if result {
                        let response = json["response"]
                        let reportOutput = response["reportOutput"]

//                        if reportOutput.isEmpty {
//                            // Handle the case when no records are found
//                            let message = "Record(s) not found for selected search criteria."
//                            self.showEmptyRecordMessage(message)
//                        } else {
                            // Records found, load the WebView
                            self.wayBillReportDataWebviewArray.append(WayBillReportDataWebView(json: reportOutput))
                           // self.webView.loadHTMLString(reportOutput.stringValue, baseURL: nil)
                                let downloadFilePath = response["downloadFilePath"].stringValue
                
                                // Fetch PDF data from the server using the downloadFilePath
                                guard let pdfURL = URL(string: downloadFilePath) else {
                                    self.popupAlert(title: nil, message: "Invalid PDF URL", actions: nil)
                                    return
                                }
                                let request = URLRequest(url: pdfURL)
                                self.webView.load(request)
                       // }
                    } else {
                        let reason: String = "Record(s) not found for selected search criteria."
                        self.popupAlert(title: nil, message: reason, actions: nil)
                    }

                }
    }
    
//    func showEmptyRecordMessage(_ message: String) {
//        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//        self.present(alertController, animated: true, completion: nil)
//    }
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
   
