//
//  BillRegisterReportVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 26/07/23.
//

import UIKit
import WebKit

class BillRegisterReportVC: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var btnDownload: UIBarButtonItem!
    @IBOutlet weak var webView: WKWebView!
    var billRegisterReportDataArray = [BillRegisterReportData]()
    var billRegisterReportWebViewArray = [BillRegisterReportWebView]()
    
    var divisionId = "", regionId = "", areaId = "", branchId = "", opBranchId = ""  ,consignorId = "" ,groupId = "", statusId = "", cnType = "", fromDate = "", toDate = "", originId = "",  userId = "",  typeIdCheck = ""
    
    var downloadParameters = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        webView.scrollView.setZoomScale(5, animated: true)
        LoadingOverlay.shared.showOverlay()
       
        API_getBillRegisterListData()
    }
    

   
    @IBAction func btnDownloadActionTap(_ sender: Any) {
    }
    
    func API_getBillRegisterListData(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        
        parameters["divisionId"] = divisionId
        parameters["regionId"] = regionId
        parameters["areaId"] = areaId
        parameters["branchId"] = (branchId != "") ? branchId : "0"
        parameters["opBranchId"] = (opBranchId != "") ? opBranchId : "0"
        parameters["consignorId"] = (consignorId != "") ? consignorId : "0"
        parameters["groupId"] = (groupId != "") ? groupId : "0"
        parameters["status"] = (statusId != "") ? statusId : "0"
        parameters["cnType"] = (cnType != "") ? cnType : "null"
        parameters["fromDate"] = fromDate
        parameters["toDate"] = toDate
        parameters["originId"] = 46
        parameters["userId"] = 61
        parameters["typeIdCheck"] = 1 // unknown is this branchttype id Check?
      
    
        URL_Session.shared.postData(viewController: self, url: MyConfig.BILL_REGISTER_REPORT, parameters: parameters ){ data in
            
           // LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            
            if result{
                let response = json["response"]
                let reportOutput = response["reportOutput"]
                self.billRegisterReportDataArray.append(BillRegisterReportData(json: reportOutput))
                self.webView.loadHTMLString(reportOutput.stringValue, baseURL: nil)
                self.downloadParameters = response["downloadParameters"].stringValue
                self.API_getBillRegisterReportWebView()
            }else{
                let reason: String = json["message"].stringValue
                self.popupAlert(title: nil, message: reason, actions: nil)
            }
           
        }
    }
   
    @IBAction func btnDownloadTap(_ sender: Any) {
    }
    
    func API_getBillRegisterReportWebView(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        //LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
 
        let url = MyConfig.BILL_REGISTER_REPORT_WEBVIEW + "?parameter=\(downloadParameters)"
        
        URL_Session.shared.postData(viewController: self, url: url, parameters: parameters ){ data in
            
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            
            if result {
                        let response = json["response"]
                        let reportOutput = response["reportOutput"]

                    if reportOutput.isEmpty{
                            // Handle the case when no records are found
                            let reason: String = "Record(s) not found for selected search criteria."
                            self.popupAlert(title: nil, message: reason, actions: nil)
                        } else {
                            // Records found, load the WebView
                            self.billRegisterReportWebViewArray.append(BillRegisterReportWebView(json: reportOutput))
                            self.webView.loadHTMLString(reportOutput.stringValue, baseURL: nil)
//                                let downloadFilePath = response["downloadFilePath"].stringValue
//
//                                // Fetch PDF data from the server using the downloadFilePath
//                                guard let pdfURL = URL(string: downloadFilePath) else {
//                                    self.popupAlert(title: nil, message: "Invalid PDF URL", actions: nil)
//                                    return
//                                }
//                                let request = URLRequest(url: pdfURL)
//                                self.webView.load(request)
                        }
                   }
            //else {
//                        let reason: String = "Record(s) not found for selected search criteria."
//                        self.popupAlert(title: nil, message: reason, actions: nil)
//                    }

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
