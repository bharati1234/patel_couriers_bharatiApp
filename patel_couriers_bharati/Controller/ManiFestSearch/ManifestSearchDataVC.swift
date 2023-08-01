//
//  ManifestSearchDataVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 20/07/23.
//

import UIKit

class ManifestSearchDataVC: UIViewController {
  
    @IBOutlet weak var tableView: UITableView!

    var ManifestListDataArray = [ManifestListData]()
    var refreshControl = UIRefreshControl()
    var routeid = "", serviceid = "", destinationid = "", statusid = "", bagno = "", fromdate = "", todate = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Manifest Search Data"
         
 
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
        
        ManifestListDataArray.removeAll()
        tableView.reloadData()
        
        API_getManifestListSearchData()
    }
    func API_getManifestListSearchData(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        parameters["routeid"] = routeid
        parameters["serviceid"] = serviceid
        parameters["destinationid"] = destinationid
        parameters["statusid"] = statusid
        parameters["bagno"] = (bagno != "") ? bagno : "0"
        parameters["fromdate"] = fromdate
        parameters["todate"] = todate
        parameters["opbranchid"] = 46
        parameters["branchId"] =  29
        
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.MANIFEST_SEARCH_LIST, parameters: parameters ){ data in
            
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            
            if result{
                let response = json["response"]
               // print(response)
                for arr in response.arrayValue{
                    self.ManifestListDataArray.append(ManifestListData(json: arr))
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
extension ManifestSearchDataVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ManifestListDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManifestSearchDataTVCell") as! ManifestSearchDataTVCell
        
        let item = self.ManifestListDataArray[indexPath.row]
        cell.Configure(with: item)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for controller in self.navigationController!.viewControllers as Array {
            //print(controller)
            if let manifestSearchVC = controller as? ManiFestSearchVC {
                // If ManiFestSearchVC is found, pass the data and pop back to it.
                manifestSearchVC.manifestNumber = self.ManifestListDataArray[indexPath.row].manifestNumber
                self.navigationController!.popToViewController(manifestSearchVC, animated: true)
                   break
               }
        }
    }
   
}
