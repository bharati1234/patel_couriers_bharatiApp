//
//  WayBillReportSearchListVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 21/07/23.
//

import UIKit

class WayBillReportSearchListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var wayBillListSearchDataArr: Array = [WayBillListSearchData]()
    var refreshControl = UIRefreshControl()
    
    var documentTypeId = "", statusId = "", consignorId = "", destinationId = "", OpBranchId = "", waybillNumber = "", fromDate = "" ,toDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Waybill Report Search List"
        if noInternet(){return}
        refresh()
        refreshControl.attributedTitle = NSAttributedString(string: "")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl) // not required when using UITableViewController

     }
    @objc func refresh(){
        
        wayBillListSearchDataArr.removeAll()
        tableView.reloadData()
        API_getWayBillReportSearchListData()
    }
    func API_getWayBillReportSearchListData(){
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
                    self.wayBillListSearchDataArr.append(WayBillListSearchData(json: arr))
                }
            }else{
                let reason: String = json["message"].stringValue
                self.popupAlert(title: nil, message: reason, actions: nil)
            }
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
}
extension WayBillReportSearchListVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.wayBillListSearchDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WayBillReportSearchListTVCell") as! WayBillReportSearchListTVCell
        let item = self.wayBillListSearchDataArr[indexPath.row]
        cell.Configure(with: item)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Waybill",bundle: nil)
        let wayBillReportDetailsListVC = mainStoryBoard.instantiateViewController(withIdentifier: "WaybillReportDetailsListVC") as! WaybillReportDetailsListVC
        wayBillReportDetailsListVC.documentTypeId = self.documentTypeId
        wayBillReportDetailsListVC.statusId = self.statusId
        wayBillReportDetailsListVC.statusId = self.statusId
        wayBillReportDetailsListVC.consignorId = self.consignorId
        wayBillReportDetailsListVC.destinationId = self.destinationId
        wayBillReportDetailsListVC.fromDate = fromDate
        wayBillReportDetailsListVC.toDate = toDate
        self.navigationController?.pushViewController(wayBillReportDetailsListVC, animated: true)
    }
  
}
    

