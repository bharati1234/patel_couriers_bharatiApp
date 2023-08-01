//
//  WaybillReportDetailsListVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 21/07/23.
//

import UIKit

class WaybillReportDetailsListVC: UIViewController {

    @IBOutlet weak var lblWayBillNo: UILabel!
    @IBOutlet weak var lblWayBillDate: UILabel!
    @IBOutlet weak var lblAirwayNo: UILabel!
    @IBOutlet weak var lblRouteCode: UILabel!
    @IBOutlet weak var lblRevRouteCode: UILabel!
    @IBOutlet weak var lblRevVendor: UILabel!
    @IBOutlet weak var lblRouteDate: UILabel!
    @IBOutlet weak var lblDestination: UILabel!
    @IBOutlet weak var lblConsignor: UILabel!
    @IBOutlet weak var lblRateCategory: UILabel!
    @IBOutlet weak var lblService: UILabel!
    @IBOutlet weak var lblProduct: UILabel!
    @IBOutlet weak var lblActualWt: UILabel!
    @IBOutlet weak var lblChWt: UILabel!
    @IBOutlet weak var lblPieces: UILabel!
    @IBOutlet weak var lblBags: UILabel!
    @IBOutlet weak var lblPaymentMode: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblWaybillAmt: UILabel!
    @IBOutlet weak var lblSERT: UILabel!
    @IBOutlet weak var lblSBC: UILabel!
    @IBOutlet weak var lblKKC: UILabel!
    @IBOutlet weak var lblSGST: UILabel!
    @IBOutlet weak var lblCGST: UILabel!
    @IBOutlet weak var lblIGST: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    
    var wayBillReportDetailsListArr: Array = [WayBillListSearchData]()
    var documentTypeId = "", statusId = "", consignorId = "", destinationId = "", OpBranchId = "", waybillNumber = "", fromDate = "" ,toDate = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Waybill Report Details List"
        
        API_getWayBillReportDetailsListData()
    }
    
    func API_getWayBillReportDetailsListData(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        
        parameters["documentTypeId"] = (documentTypeId != "") ? documentTypeId : "0"
        parameters["statusId"] = (statusId != "") ? statusId : "0"
        parameters["consignorId"] = (consignorId != "") ? consignorId : "0"
        parameters["destinationId"] = (destinationId != "") ? destinationId : "0"
        parameters["OpBranchId"] = 46
        parameters["waybillNumber"] = waybillNumber
        parameters["fromDate"] = fromDate
        parameters["toDate"] = toDate
     
        URL_Session.shared.postData(viewController: self, url: MyConfig.WAYBILL_REPORT_SEARCH_LIST, parameters: parameters ){ data in
            
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            
            if result{
                let response = json["response"]
               // print(response)
                for arr in response.arrayValue{
                    self.wayBillReportDetailsListArr.append(WayBillListSearchData(json: arr))
                    
                        let waybillNumber = arr["waybillNumber"].stringValue
                        let actualWeight = arr["actualWeight"].stringValue
                        let bags = arr["bags"].stringValue
                        let destination = arr["destination"].stringValue
                        let consignor = arr["consignor"].stringValue
                        let pieces = arr["pieces"].stringValue
                        let status = arr["status"].stringValue
                        let totalCharges = arr["totalCharges"].stringValue
                        let bookingDate = arr["bookingDate"].stringValue

                        // Assign  respective labels based on the extracted values
                        self.lblWayBillNo.text = waybillNumber
                        self.lblActualWt.text = actualWeight
                        self.lblBags.text = bags
                        self.lblDestination.text = destination
                        self.lblPieces.text = pieces
                        self.lblWayBillDate.text = bookingDate
                        self.lblConsignor.text = consignor
                        self.lblTotal.text = totalCharges
                        self.lblStatus.text = status
      
                }
            }else{
                let reason: String = json["message"].stringValue
                self.popupAlert(title: nil, message: reason, actions: nil)
            }
          
        }
    }
   

}
