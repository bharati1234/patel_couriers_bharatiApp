//
//  BaggageReportSearchDataVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 20/07/23.
//

import UIKit

class BaggageReportSearchDataVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var routeid = "", serviceid = "", destinationid = "", statusid = "", pnbrNo = "", fromdate = "", todate = ""
    var refreshControl = UIRefreshControl()
   
    var baggageListDataArray = [BaggageListData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Baggage Report Search Data"
        
    }
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            if noInternet(){return}
            refresh()
            refreshControl.attributedTitle = NSAttributedString(string: "")
            refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
            tableView.addSubview(refreshControl) // not required when using UITableViewController
        }
        
        @objc func refresh(){
            
            baggageListDataArray.removeAll()
            tableView.reloadData()
            
            API_getBaggageListSearchData()
        }
        func API_getBaggageListSearchData(){
            // self.mainView.isHidden = true
            if noInternet(){return}
            LoadingOverlay.shared.showOverlay()
            var parameters = [String:Any]()
           
            if routeid.isEmptyStr{
                parameters["routeid"] = routeid
            }
           
            if serviceid.isEmptyStr {
                parameters["serviceid"] = serviceid
            }
            if destinationid.isEmptyStr {
                parameters["destinationid"] = destinationid
            }
            if statusid.isEmptyStr {
                parameters["statusid"] = statusid
            }
            if pnbrNo.isEmptyStr {
                parameters["pnbrNo"] = pnbrNo
            }
            
            parameters["fromdate"] = fromdate
            parameters["todate"] = todate
            parameters["opbranchid"] = 46
            parameters["branchId"] =  29
            
            
            URL_Session.shared.postData(viewController: self, url: MyConfig.BAGGAGE_SEARCH_LIST, parameters: parameters ){ data in
                
                LoadingOverlay.shared.hideOverlayView()
                
                let json = JSON(data as Any)
                let result: Bool = json["isSuccess"].boolValue
                
                if result{
                    let response = json["response"]
                   // print(response)
                    for arr in response.arrayValue{
                        self.baggageListDataArray.append(BaggageListData(json: arr))
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
extension BaggageReportSearchDataVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.baggageListDataArray.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BaggageReportSearchDataTVCell") as! BaggageReportSearchDataTVCell
        let item = self.baggageListDataArray[indexPath.row]
        cell.Configure(with: item)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for controller in self.navigationController!.viewControllers as Array {
            //print(controller)
            if let baggageReportSearchVC = controller as? BaggageReportSearchVC {
                // If baggageReportSearchVC is found, pass the data and pop back to it.
                baggageReportSearchVC.brNumber = self.baggageListDataArray[indexPath.row].brnumber
                self.navigationController!.popToViewController(baggageReportSearchVC, animated: true)
                   break
            }
        }
    }
    
    
    
}
