//
//  ManifestNumberHelpVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 20/07/23.
//

import UIKit

class ManifestNumberHelpVC: UIViewController, DateTimePickerDelegate {

    @IBOutlet weak var ddRoute: DropDown!
    @IBOutlet weak var ddService: DropDown!
    @IBOutlet weak var ddDestination: DropDown!
    @IBOutlet weak var ddStatus: DropDown!
    @IBOutlet weak var txtFromDate: DTTextField!
    @IBOutlet weak var txtToDate: DTTextField!
    @IBOutlet weak var txtBagNo: DTTextField!
    @IBOutlet weak var mainView: UIView!
    
    var ManiFestRouteArr: Array = [ManiFestRoute]()
    var ManifestServiceArr: Array = [ManifestService]()
    var ManiFestStatusArr: Array = [ManiFestStatus]()
    var ManiFestDestinationArr: Array = [ManiFestDestination]()
    var manifestRouteId = "0"
    var manifestServiceId = "0"
    var manifestStatusId = "0"
    var manifestDestinationId = "0"
    var bagNo = ""
  
    var pick_type_start_date = 1, pick_type_end_date = 2
    var startDate = Date()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Manifest Number Help"
        ddRoute.mainParentView = self.view
        ddService.mainParentView = self.view
        ddDestination.mainParentView = self.view
        ddStatus.mainParentView = self.view
        
        txtFromDate.text! = DateTimeFormat.shared.convertDate(date: Date(), dateFormat: DateTimeFormat.shared.dateFormat6)
        txtToDate.text! = DateTimeFormat.shared.convertDate(date: Date(), dateFormat: DateTimeFormat.shared.dateFormat6)
        
        ddRoute.didSelect(completion: { (selected, index, id) in
            self.manifestRouteId = self.ManiFestRouteArr[index].routeId
        })
        ddService.didSelect(completion: { (selected, index, id) in
            self.manifestServiceId = self.ManifestServiceArr[index].serviceid
        })
        ddStatus.didSelect(completion: { (selected, index, id) in
            self.manifestStatusId = self.ManiFestStatusArr[index].statusId
        })
        ddDestination.didSelect(completion: { (selected, index, id) in
            self.manifestDestinationId = self.ManiFestDestinationArr[index].opbranchid
        })
        
        bagNo = txtBagNo.text!
        API_getDropDown()
    }
    @IBAction func btnFromDataTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DateTimePicker", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "DateTimePickerVC") as! DateTimePickerVC
        myAlert.delegate = self
        myAlert.selctionType = 1 //1= datePicker 2 = time picker
        myAlert.maxDate = 1
        myAlert.picktype = pick_type_start_date
        myAlert.selected_date = DateTimeFormat.shared.convertDate(date: txtFromDate.text!, dateFormat: DateTimeFormat.shared.dateFormat6)
        myAlert.modalPresentationStyle = .overCurrentContext
        myAlert.modalTransitionStyle = .crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
    @IBAction func btnToDateTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DateTimePicker", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "DateTimePickerVC") as! DateTimePickerVC
        myAlert.delegate = self
        myAlert.selctionType = 1 //1= datePicker 2 = time picker
        myAlert.maxDate = 1
        myAlert.picktype = pick_type_end_date
        //myAlert.date = startDate
        myAlert.selected_date = DateTimeFormat.shared.convertDate(date: txtToDate.text!, dateFormat: DateTimeFormat.shared.dateFormat6)
        myAlert.modalPresentationStyle = .overCurrentContext
        myAlert.modalTransitionStyle = .crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func SelectDateTime(selectedDateTime: String, selectionType: Int, picktype: Int, date: Date) {
        
        if picktype == pick_type_start_date{
            startDate = date
            txtFromDate.text! = selectedDateTime
            //tfToDate.text! = selectedDateTime
        }else{
            txtToDate.text! = selectedDateTime
            
            //postBoostDateCount = Calendar.current.dateComponents([.day], from: startDate, to: date).day! + 1
            //lblTotalDays.text! = "Total Days: \(String(describing: postBoostDateCount))"
        }
    }

    @IBAction func btnSearchTap(_ sender: Any) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Manifest",bundle: nil)
        let manifestSearchDataVC = mainStoryBoard.instantiateViewController(withIdentifier: "ManifestSearchDataVC") as! ManifestSearchDataVC
        manifestSearchDataVC.routeid = self.manifestRouteId
        manifestSearchDataVC.serviceid = self.manifestServiceId
        manifestSearchDataVC.destinationid = self.manifestDestinationId
        manifestSearchDataVC.statusid = self.manifestStatusId
        manifestSearchDataVC.bagno = self.bagNo
        manifestSearchDataVC.fromdate = DateTimeFormat.shared.convertDate(date: txtFromDate.text!, dateFromFormat: DateTimeFormat.shared.dateFormat6, dateToFormat: DateTimeFormat.shared.dateFormat1)
        manifestSearchDataVC.todate = DateTimeFormat.shared.convertDate(date: txtToDate.text!, dateFromFormat: DateTimeFormat.shared.dateFormat6, dateToFormat: DateTimeFormat.shared.dateFormat1)
        self.navigationController?.pushViewController(manifestSearchDataVC, animated: true)
        
    }
    
    func API_getDropDown(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        //parameters["branchId"] = Pref.getPref(key: Constants.shared.BRANCH_ID) as? String
        //parameters["opBranchId"] = Pref.getPref(key: Constants.shared.OP_BRANCH_ID) as? String
        
        parameters["branchId"] = 29
        parameters["opBranchId"] = 46
        
       // let url = MyConfig.MANIFEST_SEARCH_DROP_DOWN + "?branchID=" + (Pref.getPref(key: Constants.shared.BRANCH_ID)
        //as! //String) + "&DivisionId=" + (Pref.getPref(key: Constants.shared.DIVISION_ID) as! String)*/
    
        URL_Session.shared.postData(viewController: self, url: MyConfig.MANIFEST_SEARCH_DROP_DOWN, parameters: parameters ){ data in
            
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            
            if result{
                let response = json["response"]
                
                let routeServiceModel = response["routeServiceModels"]
                //print(routeServiceModel)
                for arr in routeServiceModel.arrayValue{
                    self.ManiFestRouteArr.append(ManiFestRoute(json: arr))
                    self.ddRoute.optionArray.append(arr["routecode"].stringValue)
                }
                
                let serviceViewModel = response["serviceViewModels"]
                for arr in serviceViewModel.arrayValue{
                    self.ManifestServiceArr.append(ManifestService(json: arr))
                    self.ddService.optionArray.append(arr["servicecode"].stringValue)
                }

                let manifestStatusModel = response["manifestStatusModels"]
                for arr in manifestStatusModel.arrayValue{
                    self.ManiFestStatusArr.append(ManiFestStatus(json: arr))
                    self.ddStatus.optionArray.append(arr["status"].stringValue)
                }
                let opBranchViewModel = response["opBranchViewModels"]
                for arr in opBranchViewModel.arrayValue{
                    self.ManiFestDestinationArr.append(ManiFestDestination(json: arr))
                    self.ddDestination.optionArray.append(arr["opbranchname"].stringValue)
                }
            }else{
                let reason: String = json["message"].stringValue
                self.popupAlert(title: nil, message: reason, actions: nil)
            }
            self.mainView.isHidden = false
        }
    }
    
}
