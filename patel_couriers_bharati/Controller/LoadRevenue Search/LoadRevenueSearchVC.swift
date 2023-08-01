//
//  LoadRevenueSearchVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 19/07/23.
//

import UIKit

class LoadRevenueSearchVC: UIViewController, DateTimePickerDelegate {
    
    @IBOutlet weak var ddDivision: DropDown!
    @IBOutlet weak var ddRegion: DropDown!
    @IBOutlet weak var ddArea: DropDown!
    @IBOutlet weak var ddBranch: DropDown!
    @IBOutlet weak var ddOPBranch: DropDown!
    @IBOutlet weak var ddConsignor: DropDown!
    @IBOutlet weak var ddDestination: DropDown!
    @IBOutlet weak var ddCarierVendor: DropDown!
    @IBOutlet weak var ddService: DropDown!
    @IBOutlet weak var ddProduct: DropDown!
    @IBOutlet weak var ddPaymentType: DropDown!
    @IBOutlet weak var txtFromDate: DTTextField!
    @IBOutlet weak var txtToDate: DTTextField!
    @IBOutlet weak var ddConsignorGroup: DropDown!
    
    @IBOutlet weak var btnLoadRevenueRadio: UIButton!
    @IBOutlet weak var btnOnlyLoadRadio: UIButton!
    
    var selectedRadioImage:UIImage?
    var unSelectedRadioImage:UIImage?
    
    @IBOutlet weak var mainView: UIView!
    
    var loadRevenueDivisionArr: Array = [LoadRevenueDivision]()
    var loadRevenueRegionArr: Array = [LoadRevenueRegion]()
    var loadRevenueAreaArr: Array = [LoadRevenueArea]()
    var loadRevenueBranchArr: Array = [LoadRevenueBranch]()
    var loadRevenueOpBranchArr: Array = [LoadRevenueOpBranch]()
    var loadRevenueConsignorArr: Array = [LoadRevenueConsignor]()
    var loadRevenueCarrierVendorArr: Array = [LoadRevenueCarrierVendor]()
    var loadRevenueServiceArr: Array = [LoadRevenueService]()
    var loadRevenueProductArr: Array = [LoadRevenueProduct]()
    var loadRevenuePaymentTypeArr: Array = [LoadRevenuePaymentType]()
    var loadRevenueDestinationArr: Array = [LoadRevenueDestination]()
   
    var divisionId = "0"
    var regionId = "0"
    var areaId = "0"
    var branchId = "0"
    var branchName = ""
    var opBranchId = "0"
    var destinationId = "0"
    var consignorId = "0"
    var consignorName = ""
    var carrierId = "0"
    var serviceId = "0"
    var servicenamae = ""
    var productId = "0"
    var productname = ""
    var paymentmodeid = "0"
    var paymentmode = ""
    var selectedReportCriteria = "Only Load"
    
    var pick_type_start_date = 1, pick_type_end_date = 2
    var startDate = Date()
    
    let dropdownBackgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Load Revenue Search"
        
        txtFromDate.text! = DateTimeFormat.shared.convertDate(date: Date(), dateFormat: DateTimeFormat.shared.dateFormat6)
        txtToDate.text! = DateTimeFormat.shared.convertDate(date: Date(), dateFormat: DateTimeFormat.shared.dateFormat6)
        
        ddDivision.mainParentView = self.view
        ddRegion.mainParentView = self.view
        ddArea.mainParentView = self.view
        ddBranch.mainParentView = self.view
        ddOPBranch.mainParentView = self.view
        ddConsignor.mainParentView = self.view
        ddDestination.mainParentView = self.view
        ddCarierVendor.mainParentView = self.view
        ddService.mainParentView = self.view
        ddProduct.mainParentView = self.view
        ddPaymentType.mainParentView = self.view
        ddConsignorGroup.mainParentView = self.view
       
        //Division
        ddDivision.didSelect(completion: { (selected, index, id) in
            self.divisionId = self.loadRevenueDivisionArr[index].divisionId
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
            self.regionId = self.loadRevenueRegionArr[index].regionId
            self.API_getAreaDropDown(regionId:self.regionId)
            self.ddArea.isUserInteractionEnabled = true
            self.ddArea.dropdownColor = .white
        })
        //Area
        ddArea.didSelect(completion: { (selected, index, id) in
            self.areaId = self.loadRevenueAreaArr[index].areaId
            self.API_getBranchDropDown(areaId: self.areaId)
            self.ddBranch.isUserInteractionEnabled = true
            self.ddBranch.dropdownColor = .white
      
        })
        //Branch
        ddBranch.didSelect(completion: { (selected, index, id) in
            self.branchId = self.loadRevenueBranchArr[index].branchId
            self.API_getOpBranchDropDown(branchId: self.branchId)
            self.ddOPBranch.isUserInteractionEnabled = true
            self.ddOPBranch.dropdownColor = .white
            self.branchName = selected
        })
        //OpBranch
        ddOPBranch.didSelect(completion: { (selected, index, id) in
            self.opBranchId = self.loadRevenueOpBranchArr[index].opBranchId
            
        })
        //consignor
        ddConsignor.didSelect(completion: { (selected, index, id) in
            self.consignorId = self.loadRevenueConsignorArr[index].consignorId
            self.consignorName = selected
        })
        //CarrierVendor
        ddCarierVendor.didSelect(completion: { (selected, index, id) in
            self.carrierId = self.loadRevenueCarrierVendorArr[index].carrierId
        })
        //Service
        ddService.didSelect(completion: { (selected, index, id) in
            self.serviceId = self.loadRevenueServiceArr[index].serviceId
            self.ddProduct.isUserInteractionEnabled = true
            self.ddProduct.dropdownColor = .white
            self.servicenamae = selected
        })
        //Product
        ddProduct.didSelect(completion: { (selected, index, id) in
            self.productId = self.loadRevenueProductArr[index].productId
            self.productname = selected
            
        })
        //Payment type
        ddPaymentType.didSelect(completion: { (selected, index, id) in
            self.paymentmodeid = self.loadRevenuePaymentTypeArr[index].paymentTypeId
            self.paymentmode = selected
        })
        //Destinastin
        //Payment type
        ddDestination.didSelect(completion: { (selected, index, id) in
            self.destinationId = self.loadRevenueDestinationArr[index].opBranchId
        })
        
        selectedRadioImage = UIImage(systemName: "circle.inset.filled")
        unSelectedRadioImage = UIImage(systemName: "circle")
        
        // Set the default selection
        btnLoadRevenueRadio.isSelected = false
        btnOnlyLoadRadio.isSelected = true
        
        // Set the images for both selected and normal states for both buttons
        btnLoadRevenueRadio.setImage(selectedRadioImage, for: .selected)
        btnLoadRevenueRadio.setImage(unSelectedRadioImage, for: .normal)
        
        btnOnlyLoadRadio.setImage(selectedRadioImage, for: .selected)
        btnOnlyLoadRadio.setImage(unSelectedRadioImage, for: .normal)
        
        API_getDevisionDropDown()
        API_getsearchCriteriaDropDown()
        API_getCarrierVendorDropDown()
        get_ConsignorGroupDropdown()
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
        
        self.ddProduct.isUserInteractionEnabled = false
        self.ddProduct.dropdownColor = dropdownBackgroundColor
        
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
    
    @IBAction func LoadRevenueActionTapped(_ sender: UIButton) {
        
        sender.isSelected = true
        btnOnlyLoadRadio.isSelected = false
        selectedReportCriteria = "Load Revenue"
        // Set the images for the selected and normal states
        btnLoadRevenueRadio.setImage(selectedRadioImage, for: .selected)
        btnLoadRevenueRadio.setImage(unSelectedRadioImage, for: .normal)
        print("Selected Option: \(selectedReportCriteria)")
        
    }
    
    @IBAction func onlyLoadActionTapped(_ sender: UIButton) {
        
        sender.isSelected = true
        btnLoadRevenueRadio.isSelected = false
        selectedReportCriteria = "Only Load "
        // Set the images for the selected and normal states
        btnOnlyLoadRadio.setImage(selectedRadioImage, for: .selected)
        btnOnlyLoadRadio.setImage(unSelectedRadioImage, for: .normal)
        print("Selected Option: \(selectedReportCriteria)")
        
        
    }
    
    // SEARCH TAP ACTION
    
    @IBAction func btnSearchTap(_ sender: Any) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "LoadRevenue",bundle: nil)
        let loadRevenueReportVC = mainStoryBoard.instantiateViewController(withIdentifier: "LoadRevenueReportVC") as! LoadRevenueReportVC
        loadRevenueReportVC.serviceId = serviceId
        loadRevenueReportVC.servicename = servicenamae
        loadRevenueReportVC.productId = productId
        loadRevenueReportVC.productname = productname
        loadRevenueReportVC.paymentmodeid = paymentmodeid
        loadRevenueReportVC.paymentmode = paymentmode
        loadRevenueReportVC.consignorId = consignorId
        loadRevenueReportVC.consignorName = consignorName
        loadRevenueReportVC.branchId = branchId
        loadRevenueReportVC.branchName = branchName
        loadRevenueReportVC.carrierId = carrierId
        loadRevenueReportVC.divisionId = divisionId
        loadRevenueReportVC.regionId = regionId
        loadRevenueReportVC.areaId = areaId
        loadRevenueReportVC.opBranchId = opBranchId
        loadRevenueReportVC.destinationId = destinationId
        loadRevenueReportVC.fromDate = DateTimeFormat.shared.convertDate(date: txtFromDate.text!, dateFromFormat: DateTimeFormat.shared.dateFormat6, dateToFormat: DateTimeFormat.shared.dateFormat1)
        loadRevenueReportVC.toDate = DateTimeFormat.shared.convertDate(date: txtToDate.text!, dateFromFormat: DateTimeFormat.shared.dateFormat6, dateToFormat: DateTimeFormat.shared.dateFormat1)
       self.navigationController?.pushViewController(loadRevenueReportVC, animated: true)
     
    }
    func API_getDevisionDropDown(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.LOADREVENUE_DIVISION_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.loadRevenueDivisionArr.append(LoadRevenueDivision(json: arr))
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
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.LOADREVENUE_REGION_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.loadRevenueRegionArr.append(LoadRevenueRegion(json: arr))
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
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.LOADREVENUE_AREA_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.loadRevenueAreaArr.append(LoadRevenueArea(json: arr))
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
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.LOADREVENUE_BRANCH_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.loadRevenueBranchArr.append(LoadRevenueBranch(json: arr))
                    self.ddBranch.optionArray.append(arr["branchName"].stringValue)
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
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.LOADREVENUE_OPBRANCH_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.loadRevenueOpBranchArr.append(LoadRevenueOpBranch(json: arr))
                    self.ddOPBranch.optionArray.append(arr["opBranchName"].stringValue)
                }
            }else{
                //let reason: String = json["message"].stringValue
                let reason: String = "OP Branch Not Found Under This Branch"
                self.popupAlert(title: nil, message: reason, actions: nil)
                self.ddOPBranch.isUserInteractionEnabled = false
                self.ddOPBranch.backgroundColor = self.dropdownBackgroundColor
            }
            self.mainView.isHidden = false
        }
    }
    func API_getsearchCriteriaDropDown(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        // parameters["divId"] = Pref.getPref(key: Constants.shared.DIVISION_ID)
        parameters["waybillNos"] = "722355966"
        parameters["inhouseNo"] = ""
        parameters["branchID"] = 29
        parameters["opBranchID"] = 46
        parameters["userID"] = 61
        
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.LOADREVENUE_SEARCH_CRITERIA_DROPDOWN,parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                let consignorModel = response["consignorModels"]
                for arr in consignorModel.arrayValue{
                    self.loadRevenueConsignorArr.append(LoadRevenueConsignor(json: arr))
                    self.ddConsignor.optionArray.append(arr["description"].stringValue)
                }
                
                let loadRevenueDestinationModel = response["waybillOpbranchModels"]
                for arr in loadRevenueDestinationModel.arrayValue{
                    self.loadRevenueDestinationArr.append(LoadRevenueDestination(json: arr))
                    self.ddDestination.optionArray.append(arr["opBranchName"].stringValue)
                }
               
                let servicemodel = response["servicemodel"]
                for arr in servicemodel.arrayValue{
                    self.loadRevenueServiceArr.append(LoadRevenueService(json: arr))
                    self.ddService.optionArray.append(arr["serviceName"].stringValue)
                }
                
                let productModel = response["productModels"]
                for arr in productModel.arrayValue{
                    self.loadRevenueProductArr.append(LoadRevenueProduct(json: arr))
                    self.ddProduct.optionArray.append(arr["productName"].stringValue)
                }
                
                let paymentModeModel = response["paymentModeModels"]
                for arr in paymentModeModel.arrayValue{
                    self.loadRevenuePaymentTypeArr.append(LoadRevenuePaymentType(json: arr))
                    self.ddPaymentType.optionArray.append(arr["payMod"].stringValue)
                }
            }else{
                let reason: String = json["message"].stringValue
                self.popupAlert(title: nil, message: reason, actions: nil)
            }
            self.mainView.isHidden = false
        }
    }
    func API_getCarrierVendorDropDown(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        // parameters["divId"] = Pref.getPref(key: Constants.shared.DIVISION_ID)
        parameters["branchId"] = 29
        parameters["divisionId"] = 0
        
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.LOADREVENUE_CARRIERVENDOR_DROPDOWN,parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.loadRevenueCarrierVendorArr.append(LoadRevenueCarrierVendor(json: arr))
                    self.ddCarierVendor.optionArray.append(arr["description"].stringValue)
                }
            }else{
                let reason: String = json["message"].stringValue
                self.popupAlert(title: nil, message: reason, actions: nil)
            }
            self.mainView.isHidden = false
        }
    }
    func get_ConsignorGroupDropdown(){
        ddConsignorGroup.optionArray = ["Branch","Consignor","Carrier Vendor","Destination","Payment Type","Transport Type","Route","Associate & Sundry Wise","Date Wise"]
        
    }
}
