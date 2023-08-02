//
//  WayBillReportSearchVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 19/07/23.
//

import UIKit

class WayBillReportSearchVC: UIViewController, DateTimePickerDelegate {

    @IBOutlet weak var ddDivision: DropDown!
    @IBOutlet weak var ddRegion: DropDown!
    @IBOutlet weak var ddArea: DropDown!
    @IBOutlet weak var ddBranch: DropDown!
    @IBOutlet weak var ddOPBranch: DropDown!
    @IBOutlet weak var ddService: DropDown!
    @IBOutlet weak var ddProduct: DropDown!
    @IBOutlet weak var ddPaymentType: DropDown!
    @IBOutlet weak var ddConsignor: DropDown!
    @IBOutlet weak var ddDestination: DropDown!
    @IBOutlet weak var ddRoute: DropDown!
    @IBOutlet weak var ddRateCategory: DropDown!
    @IBOutlet weak var ddWaybillStatus: DropDown!
    @IBOutlet weak var ddDocType: DropDown!
    @IBOutlet weak var txtFromDate: DTTextField!
    @IBOutlet weak var txtToDate: DTTextField!
    @IBOutlet weak var txtWBFrom: DTTextField!
    @IBOutlet weak var txtWBTo: DTTextField!
    @IBOutlet weak var ddSearchOn: DropDown!
    @IBOutlet weak var ddGroupCriteria: DropDown!
    @IBOutlet weak var ddSortCiteria: DropDown!
    @IBOutlet weak var ddReportType: DropDown!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var btnCheckboxGroupOn: UIButton!
    var wayBillDivisionArr: Array = [LoadRevenueDivision]()
    var wayBillRegionArr: Array = [LoadRevenueRegion]()
    var wayBillAreaArr: Array = [LoadRevenueArea]()
    var wayBillBranchArr: Array = [LoadRevenueBranch]()
    var wayBillOpBranchArr: Array = [LoadRevenueOpBranch]()
    
    var wayBillServiceArr: Array = [WayBillCommonModelFromService]()
    var wayBillProductArr: Array = [WayBillProduct]()
    var wayBillPaymentTypeArr: Array = [WayBillCommonModelFromService]()
    var wayBillConsignorArr: Array = [WayBillCommonModelFromService]()
    var wayBillConsignorGroupArr: Array = [WayBillCommonModelFromService]()
    var wayBillDestinationArr: Array = [WayBillCommonModelFromService]()
    var wayBillRouteArr: Array = [WayBillCommonModelFromService]()
    var wayBillRateCategoryArr: Array = [WayBillCommonModelFromService]()
    var wayBillStatusArr: Array = [WayBillCommonModelFromService]()
    
    var wayBillDocumentTypeArr: Array = [WayBillCommonModelFromService]()
    var wayBillSearchOnArr: Array = ["Booking Date","Invoice Date"]
    var wayBillGroupCriteriaArr: Array = ["Branch","Customer","Carrier"]
    var wayBillSortCriteriaArr: Array = ["Status","Customer","Carrier","Destination","WayBillNo","WayBillDate"]
    var wayBillReportTypeArr: Array = ["Charge Summary","Charge Details","Monthly Charge Summary","Waybill Audited","DBS"]
   
    var selectedCheckboxImage:UIImage?
    var unSelectedCheckboxImage:UIImage?
    
    var divisionId = "0"
    var regionId = "0"
    var areaId = "0"
    var branchId = "0"
    var opBranchId = "0"
    var consignorId = "0"
    var carrierId = "0"
    var serviceId = "0"
    var productId = "0"
    var paymentTypeId = "0"
    var routeId = "0"
    var destinationId = "0"
    var rateCategoryId = "0"
    var statusId = "0"
  
    var sort = "" // SortCriteria
    var selectedSearchOnId = "0"
    var selectedDocTypeId = ""
    
    var selectedBranchName = ""
    var reportCriteria = "" // Report Type
   
    var reportType = "" // Group Criteria
    var valueRadio = "1" // Report Type id
    var groupOnconsignor: Int = 0
    
    let dropdownBackgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
    
    var pick_type_start_date = 1, pick_type_end_date = 2
    var startDate = Date()
   
    var response = JSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Waybill Report Search"
        
       txtFromDate.text! = DateTimeFormat.shared.convertDate(date: Date(), dateFormat: DateTimeFormat.shared.dateFormat6)
       txtToDate.text! = DateTimeFormat.shared.convertDate(date: Date(), dateFormat: DateTimeFormat.shared.dateFormat6)
       
        ddDivision.mainParentView = self.view
        ddRegion.mainParentView = self.view
        ddArea.mainParentView = self.view
        ddBranch.mainParentView = self.view
        ddOPBranch.mainParentView = self.view
        ddService.mainParentView = self.view
        ddProduct.mainParentView = self.view
        ddPaymentType.mainParentView = self.view
        ddConsignor.mainParentView = self.view
        ddDestination.mainParentView = self.view
        ddRoute.mainParentView = self.view
        ddRateCategory.mainParentView = self.view
        ddWaybillStatus.mainParentView = self.view
        ddDocType.mainParentView = self.view
        ddSearchOn.mainParentView = self.view
        ddGroupCriteria.mainParentView = self.view
        ddSortCiteria.mainParentView = self.view
        ddReportType.mainParentView = self.view
        
        
        //division
        ddDivision.didSelect(completion: { (selected, index, id) in
            self.divisionId = self.wayBillDivisionArr[index].divisionId
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
            self.regionId = self.wayBillRegionArr[index].regionId
            self.API_getAreaDropDown(regionId:self.regionId)
            self.ddArea.isUserInteractionEnabled = true
            self.ddArea.dropdownColor = .white
        })
        //Area
        ddArea.didSelect(completion: { (selected, index, id) in
            self.areaId = self.wayBillAreaArr[index].areaId
            self.API_getBranchDropDown(areaId: self.areaId)
            self.ddBranch.isUserInteractionEnabled = true
            self.ddBranch.dropdownColor = .white
        })
        //Branch
        ddBranch.didSelect(completion: { (selected, index, id) in
            self.branchId = self.wayBillBranchArr[index].branchId
            self.API_getOpBranchDropDown(branchId: self.branchId)
            self.selectedBranchName = selected
            self.ddOPBranch.isUserInteractionEnabled = true
            self.ddOPBranch.dropdownColor = .white
        })
        //OpBranch
        ddOPBranch.didSelect(completion: { (selected, index, id) in
            self.opBranchId = self.wayBillOpBranchArr[index].opBranchId
        })
        //Service
        ddService.didSelect(completion: { (selected, index, id) in
            self.serviceId = self.wayBillServiceArr[index].serviceid
            self.API_getProductDropDown(serviceId:self.serviceId )
            self.ddProduct.isUserInteractionEnabled = true
            self.ddProduct.dropdownColor = .white
        })
        //Product
        ddProduct.didSelect(completion: { (selected, index, id) in
            self.productId = self.wayBillProductArr[index].productId
            self.ddProduct.isUserInteractionEnabled = true
            self.ddProduct.dropdownColor = .white
        })
        //Payment Type
        ddPaymentType.didSelect(completion: { (selected, index, id) in
            self.paymentTypeId = self.wayBillPaymentTypeArr[index].paymentmodeid
        })
        //Consignor
        ddConsignor.didSelect(completion: { (selected, index, id) in
            self.consignorId = self.wayBillConsignorArr[index].consignorId
        })
        //Route
        ddRoute.didSelect(completion: { (selected, index, id) in
            self.routeId = self.wayBillRouteArr[index].routeId
        })
        
        //Rate Category
        ddRateCategory.didSelect(completion: { (selected, index, id) in
            self.rateCategoryId = self.wayBillRateCategoryArr[index].rateCategoryId
        })
        //WAybill Status
        ddWaybillStatus.didSelect(completion: { (selected, index, id) in
            self.statusId = self.wayBillStatusArr[index].statusId
        })
        
        //Sort
        ddSortCiteria.didSelect(completion: { (selected, index, id) in
            self.sort  =  selected
            if self.sort == "Status" {
                self.sort = "WaybillStatus"
            }else if self.sort == "Customer" {
                self.sort = "Description"
            }else if self.sort == "Carrier" {
                self.sort = "RouteCodes"
            }else if self.sort == "Destination" {
                self.sort = "OpBranch"
            }else if self.sort == "WaybillNo" {
                self.sort = "WBNO"
            }else if self.sort == "WaybillDate" {
                self.sort = "BookDate"
            }
        })
        
        //Report Type
        ddReportType.didSelect(completion: { (selected, index, id) in
            self.reportCriteria = String(index + 1)
        })
        
        //Document Type
        ddDocType.didSelect(completion: { (selected, index, id) in
            self.selectedDocTypeId = self.wayBillDocumentTypeArr[index].documentypeId
        })
        
        //Search on
        ddSearchOn.didSelect(completion: { (selected, index, id) in
            self.selectedSearchOnId = String(index)
        })
        
        //Group Criteria
        ddGroupCriteria.didSelect(completion: { (selected, index, id) in
            self.reportType =  selected
            if self.reportType == "Customer" {
                self.reportType = "Consignor"
            }
            self.valueRadio  =  String(index + 1)
        })
       
        // Destination
        ddDestination.didSelect(completion: { (selected, index, id) in
            self.destinationId  =  self.wayBillDestinationArr[index].opBranchId
        })
        setCheckboxImage()
       
        API_getDevisionDropDown()
        API_getReportSearchDropDown()
      
        getSearchOnDropdown()
        getGroupCriteria()
        getSortCriteria()
        getReportType()
        
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
    
    @IBAction func groupOnConsignorActionTapped(_ sender: UIButton) {
      
            // Toggle the isSelected property
            sender.isSelected = !sender.isSelected
            // Set the tag based on the isSelected state
            sender.tag = sender.isSelected ? 1 : 0
            // Set the images for the selected and normal states
            btnCheckboxGroupOn.setImage(selectedCheckboxImage, for: .selected)
            btnCheckboxGroupOn.setImage(unSelectedCheckboxImage, for: .normal)
            
            groupOnconsignor = sender.tag
            if groupOnconsignor == 1{
               API_getConsigneronGroupSelectionDropDown()
            }
        
        
    }
   
    @IBAction func btnSearchTap(_ sender: Any) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Waybill",bundle: nil)
        let wayBillReportVC = mainStoryBoard.instantiateViewController(withIdentifier: "WayBillReportVC") as! WayBillReportVC
        wayBillReportVC.sort = self.sort
        wayBillReportVC.reportType = self.reportType // Group Criteria
        wayBillReportVC.divisionId = self.divisionId
        wayBillReportVC.regionId = self.regionId
        wayBillReportVC.areaId = self.areaId
        wayBillReportVC.branchId = self.branchId
        wayBillReportVC.opBranchId = self.opBranchId
        wayBillReportVC.serviceId = self.serviceId
        wayBillReportVC.productId = self.productId
        wayBillReportVC.payTypeId = self.paymentTypeId
        wayBillReportVC.consignorId = self.consignorId
        wayBillReportVC.destinationId = self.destinationId
        wayBillReportVC.routeId = self.routeId
        wayBillReportVC.fromDate = DateTimeFormat.shared.convertDate(date: txtFromDate.text!, dateFromFormat: DateTimeFormat.shared.dateFormat6, dateToFormat: DateTimeFormat.shared.dateFormat1)
        wayBillReportVC.toDate = DateTimeFormat.shared.convertDate(date: txtToDate.text!, dateFromFormat: DateTimeFormat.shared.dateFormat6, dateToFormat: DateTimeFormat.shared.dateFormat1)
        wayBillReportVC.rateCategoryId = self.rateCategoryId
        wayBillReportVC.statusId = self.statusId
        wayBillReportVC.typeId = self.selectedDocTypeId
        wayBillReportVC.searchOn = self.selectedSearchOnId
        wayBillReportVC.groupId = String(self.groupOnconsignor)
        wayBillReportVC.fromWaybill = txtWBFrom.text!
        wayBillReportVC.toWaybill = txtWBTo.text!
        wayBillReportVC.opBrachName = self.selectedBranchName
        wayBillReportVC.valueRadio = self.valueRadio // Group Criteria index
        wayBillReportVC.reportCriteria = self.reportCriteria // Report Type index
        wayBillReportVC.groupConsignor = String(self.groupOnconsignor)
        self.navigationController?.pushViewController(wayBillReportVC, animated: true)
    }
    
    func API_getDevisionDropDown(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.WAYBILL_DIVISION_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.wayBillDivisionArr.append(LoadRevenueDivision(json: arr))
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
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.WAYBILL_REGION_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.wayBillRegionArr.append(LoadRevenueRegion(json: arr))
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
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.WAYBILL_AREA_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.wayBillAreaArr.append(LoadRevenueArea(json: arr))
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
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.WAYBILL_BRANCH_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.wayBillBranchArr.append(LoadRevenueBranch(json: arr))
                    self.ddBranch.optionArray.append(arr["branchName"].stringValue)
                    self.ddDestination.optionArray.append(arr["branchName"].stringValue)
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
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.WAYBILL_OPBRANCH_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.wayBillOpBranchArr.append(LoadRevenueOpBranch(json: arr))
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
    func API_getReportSearchDropDown(){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        // parameters["divId"] = Pref.getPref(key: Constants.shared.DIVISION_ID)
        parameters["waybillNos"] = ""
        parameters["inhouseNo"] = ""
        parameters["branchID"] = 29
        parameters["opBranchID"] = 46
        parameters["userID"] = 61
        
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.WAYBILL_REPORT_SEARCH_DROPDOWN,parameters: parameters){ [self] data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                
                self.response = json["response"]
                let servicemodel = response["rptServiceModels"]
                for arr in servicemodel.arrayValue{
                    self.wayBillServiceArr.append(WayBillCommonModelFromService(json: arr))
                    self.ddService.optionArray.append(arr["servicename"].stringValue)
                }
                
                
                let paymentModeModel = response["rptPaymentModeModels"]
                for arr in paymentModeModel.arrayValue{
                    self.wayBillPaymentTypeArr.append(WayBillCommonModelFromService(json: arr))
                    self.ddPaymentType.optionArray.append(arr["paymentmode"].stringValue)
                }
                
                let consignorModel = response["rptConsignorModels"]
                for arr in consignorModel.arrayValue{
                    self.wayBillConsignorArr.append(WayBillCommonModelFromService(json: arr))
                    self.ddConsignor.optionArray.append(arr["consignorName"].stringValue)
                }
                let destinationModel = response["rptOpBranchModels"]
                for arr in destinationModel.arrayValue{
                    self.wayBillDestinationArr.append(WayBillCommonModelFromService(json: arr))
                    self.ddDestination.optionArray.append(arr["opBranchName"].stringValue)
                }
                
                let routeModel = response["rptRouteModels"]
                for arr in routeModel.arrayValue{
                    self.wayBillRouteArr.append(WayBillCommonModelFromService(json: arr))
                    self.ddRoute.optionArray.append(arr["routeCode"].stringValue)
                }
                
                
                let rateCategoryModel = response["rptRateCategoryModels"]
                for arr in rateCategoryModel.arrayValue{
                    self.wayBillRateCategoryArr.append(WayBillCommonModelFromService(json: arr))
                    self.ddRateCategory.optionArray.append(arr["rateCategoryName"].stringValue)
                }
             
                let statusModel = response["rptStatusModels"]
                for arr in statusModel.arrayValue{
                    self.wayBillStatusArr.append(WayBillCommonModelFromService(json: arr))
                    self.ddWaybillStatus.optionArray.append(arr["statusName"].stringValue)
                }
       
                let documentTypeModel = response["rptDocumentTypeModels"]
                for arr in documentTypeModel.arrayValue{
                    self.wayBillDocumentTypeArr.append(WayBillCommonModelFromService(json: arr))
                    self.ddDocType.optionArray.append(arr["documentType"].stringValue)
                }
                
            }else{
                let reason: String = json["message"].stringValue
                self.popupAlert(title: nil, message: reason, actions: nil)
            }
            self.mainView.isHidden = false
        }
    }
    func API_getConsigneronGroupSelectionDropDown(){
        self.wayBillConsignorArr.removeAll()
        self.ddConsignor.optionArray.removeAll()
        
        let response = response
        
        let consignerGroupModel = response["rptGroupModels"]
        for arr in consignerGroupModel.arrayValue{
            self.wayBillConsignorArr.append(WayBillCommonModelFromService(json: arr))
            self.ddConsignor.optionArray.append(arr["groupName"].stringValue)
            
        }
    }
    func API_getProductDropDown(serviceId:String){
        // self.mainView.isHidden = true
        if noInternet(){return}
        LoadingOverlay.shared.showOverlay()
        var parameters = [String:Any]()
        // parameters["divId"] = Pref.getPref(key: Constants.shared.DIVISION_ID)
        parameters["serviceId"] = serviceId
        
        URL_Session.shared.postData(viewController: self, url: MyConfig.WAYBILL_PRODUCT_DROPDOWN, parameters: parameters){ data in
            LoadingOverlay.shared.hideOverlayView()
            
            let json = JSON(data as Any)
            let result: Bool = json["isSuccess"].boolValue
            if result{
                let response = json["response"]
                
                for arr in response.arrayValue{
                    self.wayBillProductArr.append(WayBillProduct(json: arr))
                    self.ddProduct.optionArray.append(arr["productName"].stringValue)
                }
            }else{
                //let reason: String = json["message"].stringValue
                //self.popupAlert(title: nil, message: reason, actions: nil)
                //let reason: String = json["message"].stringValue
                let reason: String = " No Product Found Under This Service"
                self.popupAlert(title: nil, message: reason, actions: nil)
                self.ddProduct.isUserInteractionEnabled = false
                self.ddProduct.backgroundColor = self.dropdownBackgroundColor
            }
            self.mainView.isHidden = false
        }
    }
 
    func getSearchOnDropdown(){
        self.ddSearchOn.optionArray = wayBillSearchOnArr
    }
    func getGroupCriteria(){
        self.ddGroupCriteria.optionArray = wayBillGroupCriteriaArr
    }
    func getSortCriteria(){
        self.ddSortCiteria.optionArray = wayBillSortCriteriaArr
    }
    func getReportType(){
        self.ddReportType.optionArray = wayBillReportTypeArr
    }
}
