//
//  BillRegisterVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 19/07/23.
//

import UIKit

class BillRegisterVC: UIViewController, DateTimePickerDelegate {
    
    @IBOutlet weak var ddDivision: DropDown!
    @IBOutlet weak var ddRegion: DropDown!
    @IBOutlet weak var ddArea: DropDown!
    @IBOutlet weak var ddBranch: DropDown!
    @IBOutlet weak var ddOPBranch: DropDown!
    @IBOutlet weak var ddBranchType: DropDown!
    @IBOutlet weak var ddCosignor: DropDown!
    @IBOutlet weak var ddStatus: DropDown!
    @IBOutlet weak var txtFromDate: DTTextField!
    @IBOutlet weak var txtToDate: DTTextField!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var btnCheckboxGroupOn: UIButton!
    var billRegisterDivisionArr: Array = [LoadRevenueDivision]()
    var billRegisterRegionArr: Array = [LoadRevenueRegion]()
    var billRegisterAreaArr: Array = [LoadRevenueArea]()
    var billRegisterBranchArr: Array = [LoadRevenueBranch]()
    var billRegisterOpBranchArr: Array = [LoadRevenueOpBranch]()
    var billRegisterBranchTypeArr: Array = ["Normal Inv","Transshipment Inv","Credit Note","Inv/CN Summary","Paid Inv"]
    var billRegisterStatusArr: Array = ["Active","InActive"]
    var billRegisterConsignerArr: Array = [BillRegisterConsigner]()
    var billRegisterconsignerGroupArr: Array = [BillRegisterConsigner]()
  
    var divisionId = "0"
    var regionId = "0"
    var areaId = "0"
    var branchId = "0"
    var opBranchId = "0"
    var selectedGroupConsignorId: Int = 0
    var consignorId = "0"
    var statusId = "0"
    var selectedcnType = ""
    
    var selectedCheckboxImage:UIImage?
    var unSelectedCheckboxImage:UIImage?
    
    let dropdownBackgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
    
    var pick_type_start_date = 1, pick_type_end_date = 2
    var startDate = Date()
    
    var response = JSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bill Register"
        
        txtFromDate.text! = DateTimeFormat.shared.convertDate(date: Date(), dateFormat: DateTimeFormat.shared.dateFormat6)
        txtToDate.text! = DateTimeFormat.shared.convertDate(date: Date(), dateFormat: DateTimeFormat.shared.dateFormat6)
        
        ddDivision.mainParentView = self.view
        ddRegion.mainParentView = self.view
        ddArea.mainParentView = self.view
        ddBranch.mainParentView = self.view
        ddOPBranch.mainParentView = self.view
        ddCosignor.mainParentView = self.view
        ddBranchType.mainParentView = self.view
        ddStatus.mainParentView = self.view
        
        
        //division
        ddDivision.didSelect(completion: { (selected, index, id) in
            self.divisionId = self.billRegisterDivisionArr[index].divisionId
            self.ddRegion.text = "Select Region"
            self.ddArea.text = "Select Area"
            self.ddBranch.text = "Select Branch"
            self.ddOPBranch.text = "Select OpBranch"
            self.API_getRegionDropDown(divId: self.divisionId)
            self.ddRegion.isUserInteractionEnabled = true
            self.ddRegion.dropdownColor = .white
            
        })
        //Region
        ddRegion.didSelect(completion: { (selected, index, id) in
            self.regionId = self.billRegisterRegionArr[index].regionId
            self.API_getAreaDropDown(regionId:self.regionId)
            
            self.ddArea.isUserInteractionEnabled = true
            self.ddArea.dropdownColor = .white
        })
        //Area
        ddArea.didSelect(completion: { (selected, index, id) in
            self.areaId = self.billRegisterAreaArr[index].areaId
            self.API_getBranchDropDown(areaId: self.areaId)
            self.ddBranch.isUserInteractionEnabled = true
            self.ddBranch.dropdownColor = .white
        })
        //Branch
        ddBranch.didSelect(completion: { (selected, index, id) in
            self.branchId = self.billRegisterBranchArr[index].branchId
            self.API_getOpBranchDropDown(branchId: self.branchId)
            self.ddOPBranch.isUserInteractionEnabled = true
            self.ddOPBranch.dropdownColor = .white
        })
        //OpBranch
        ddOPBranch.didSelect(completion: { (selected, index, id) in
            self.opBranchId = self.billRegisterOpBranchArr[index].opBranchId
           
        })
        //Consigner
        ddCosignor.didSelect(completion: { (selected, index, id) in
            self.consignorId = self.billRegisterConsignerArr[index].consignorId
            self.selectedcnType = selected
        })
        //Status
        ddStatus.didSelect(completion: { (selected, index, id) in
            self.statusId = String(index)
        })
        
        self.ddBranchType.optionArray = billRegisterBranchTypeArr
        self.ddStatus.optionArray = billRegisterStatusArr
       
        setCheckboxImage()
        
        API_getDevisionDropDown()
        API_getConsignerDropDown()
        disableDropdowns()
        
    }
    func disableDropdowns(){
        self.ddRegion.isUserInteractionEnabled = false
        self.ddRegion.dropdownColor = dropdownBackgroundColor
       
        self.ddArea.isUserInteractionEnabled = false
        self.ddArea.dropdownColor = dropdownBackgroundColor
        
        self.ddBranch.isUserInteractionEnabled = false
        self.ddBranch.dropdownColor = dropdownBackgroundColor
        
        self.ddOPBranch.isUserInteractionEnabled = false
        self.ddOPBranch.dropdownColor = dropdownBackgroundColor
        
    }
    func setCheckboxImage(){
        selectedCheckboxImage = UIImage(systemName: "checkmark.square.fill")
        unSelectedCheckboxImage = UIImage(systemName: "square")
        
        // Set the default selection
        self.btnCheckboxGroupOn.isSelected = false
        self.btnCheckboxGroupOn.tag = 0
     
        // Set the images for both selected and normal states for both buttons
        btnCheckboxGroupOn.setImage(selectedCheckboxImage, for: .selected)
        btnCheckboxGroupOn.setImage(unSelectedCheckboxImage, for: .normal)
        
    }
    @IBAction func groupOnConsignorActionTapped(_ sender: UIButton) {
        
        // Toggle the isSelected property
        sender.isSelected = !sender.isSelected
        // Set the tag based on the isSelected state
        sender.tag = sender.isSelected ? 1 : 0
        
        // Set the images for the selected and normal states
        btnCheckboxGroupOn.setImage(selectedCheckboxImage, for: .selected)
        btnCheckboxGroupOn.setImage(unSelectedCheckboxImage, for: .normal)
        
        selectedGroupConsignorId = sender.tag
        if selectedGroupConsignorId == 1{
           API_getConsigneronGroupSelectionDropDown()
        }
    
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
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "BillRegister",bundle: nil)
        let billRegisterReportVC = mainStoryBoard.instantiateViewController(withIdentifier: "BillRegisterReportVC") as! BillRegisterReportVC
        billRegisterReportVC.divisionId = self.divisionId
        billRegisterReportVC.regionId = self.regionId
        billRegisterReportVC.areaId = self.areaId
        billRegisterReportVC.branchId = self.branchId
        billRegisterReportVC.opBranchId = self.opBranchId
        billRegisterReportVC.consignorId = self.consignorId
        billRegisterReportVC.groupId = String(self.selectedGroupConsignorId)
        billRegisterReportVC.statusId = self.statusId
        billRegisterReportVC.cnType = self.selectedcnType
        billRegisterReportVC.fromDate = DateTimeFormat.shared.convertDate(date: txtFromDate.text!, dateFromFormat: DateTimeFormat.shared.dateFormat6, dateToFormat: DateTimeFormat.shared.dateFormat1)
        billRegisterReportVC.toDate = DateTimeFormat.shared.convertDate(date: txtToDate.text!, dateFromFormat: DateTimeFormat.shared.dateFormat6, dateToFormat: DateTimeFormat.shared.dateFormat1)
        self.navigationController?.pushViewController(billRegisterReportVC, animated: true)
        
    }
    
    
    func API_getDevisionDropDown(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.BILL_REGISTER_DIVISION_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.billRegisterDivisionArr.append(LoadRevenueDivision(json: arr))
                    self.ddDivision.optionArray.append(arr["divisionShortName"].stringValue)
                }
            }else{
                let reason: String = json["message"].stringValue
                self.popupAlert(title: nil, message: reason, actions: nil)
            }
            self.mainView.isHidden = false
        }
    }
    func API_getRegionDropDown(divId:String){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        // parameters["divId"] = Pref.getPref(key: Constants.shared.DIVISION_ID)
        parameters["divId"] = divId
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.BILL_REGISTER_REGION_DROPDOWN, parameters: parameters){ [self] data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.billRegisterRegionArr.append(LoadRevenueRegion(json: arr))
                    self.ddRegion.optionArray.append(arr["regionName"].stringValue)
                }
            }else{
                //let reason: String = json["message"].stringValue
                let reason: String = "Region Not Found Under This Division"
                self.popupAlert(title: nil, message: reason, actions: nil)
                self.ddRegion.isUserInteractionEnabled = false
                self.ddRegion.backgroundColor = self.dropdownBackgroundColor
                
            }
            self.mainView.isHidden = false
        }
    }
    func API_getAreaDropDown(regionId:String){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        // parameters["divId"] = Pref.getPref(key: Constants.shared.DIVISION_ID)
        parameters["regionId"] = regionId
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.BILL_REGISTER_AREA_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.billRegisterAreaArr.append(LoadRevenueArea(json: arr))
                    self.ddArea.optionArray.append(arr["area"].stringValue)
                }
            }else{
                //let reason: String = json["message"].stringValue
                let reason: String = "Area Not Found Under This Region"
                self.popupAlert(title: nil, message: reason, actions: nil)
                self.ddArea.isUserInteractionEnabled = false
                self.ddArea.backgroundColor = self.dropdownBackgroundColor
                
            }
            self.mainView.isHidden = false
        }
    }
    func API_getBranchDropDown(areaId:String){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        // parameters["divId"] = Pref.getPref(key: Constants.shared.DIVISION_ID)
        parameters["parentId"] = areaId
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.BILL_REGISTER_BRANCH_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.billRegisterBranchArr.append(LoadRevenueBranch(json: arr))
                    self.ddBranch.optionArray.append(arr["branchName"].stringValue)
                    //self.ddDestination.optionArray.append(arr["branchName"].stringValue)
                }
            }else{
                //let reason: String = json["message"].stringValue
                let reason: String = "Branch Not Found Under This Area"
                self.popupAlert(title: nil, message: reason, actions: nil)
                self.ddBranch.isUserInteractionEnabled = false
                self.ddBranch.backgroundColor = self.dropdownBackgroundColor
            }
            self.mainView.isHidden = false
        }
    }
    func API_getOpBranchDropDown(branchId:String){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        // parameters["divId"] = Pref.getPref(key: Constants.shared.DIVISION_ID)
        parameters["branchId"] = branchId
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.BILL_REGISTER_OPBRANCH_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.billRegisterOpBranchArr.append(LoadRevenueOpBranch(json: arr))
                    self.ddOPBranch.optionArray.append(arr["opBranchName"].stringValue)
                }
            }else{
                //let reason: String = json["message"].stringValue
                let reason: String = "Op Branch Not Found Under This Branch"
                self.popupAlert(title: nil, message: reason, actions: nil)
                self.ddBranch.isUserInteractionEnabled = false
                self.ddBranch.backgroundColor = self.dropdownBackgroundColor
            }
            self.mainView.isHidden = false
        }
    }
    func API_getConsignerDropDown(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        // parameters["divId"] = Pref.getPref(key: Constants.shared.DIVISION_ID)
        parameters["branchId"] = 29
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.BILL_REGISTER_CONSIGNOR_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                self.response = json["response"]
                let consignorModel = self.response["consignorModel"]
                for arr in consignorModel.arrayValue{
                    self.billRegisterConsignerArr.append(BillRegisterConsigner(json: arr))
                    self.ddCosignor.optionArray.append(arr["description"].stringValue)
                }
             
            }else{
                let reason: String = json["message"].stringValue
                self.popupAlert(title: nil, message: reason, actions: nil)
            }
            self.mainView.isHidden = false
        }
    }
    func API_getConsigneronGroupSelectionDropDown(){
        self.billRegisterConsignerArr.removeAll()
        self.ddCosignor.optionArray.removeAll()
        
        let response = response
        
        let consignerGroupModel = response["groupModel"]
        for arr in consignerGroupModel.arrayValue{
            self.billRegisterConsignerArr.append(BillRegisterConsigner(json: arr))
            self.ddCosignor.optionArray.append(arr["groupName"].stringValue)
            
        }
    }
    
  
    
    
}
