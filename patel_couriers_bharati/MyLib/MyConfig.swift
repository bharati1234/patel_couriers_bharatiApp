//
//  MyConfig.swift
//  DrawableExample
//
//  Created by Alap Soni on 02/10/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation
class MyConfig {
    
    //test urls
    static let MAIN_URL = "https://krios-hopsuiteapi.azurewebsites.net/api/"
    
    //test url
    //static let MAIN_URL = "https://www.freshfishco.in/"
    //static let URL = (Pref.getPref(key: Constants.shared.BASE_URL) as! String)
    
    //Api
    static public let VERSION = MAIN_URL + "get_version"
        
    static public let LOGIN = MAIN_URL + "/Authentication/ValidateUser"
    
    //POD
    static public let POD_DROP_DOWN = MAIN_URL + "/PodTransaction/GetPODdropdown"
    static public let POD_LIST = MAIN_URL + "/PodTransaction/GetPODList"
    static public let POD_DETAILS = MAIN_URL + "/PodTransaction/PODDetailsEdit"
    static public let UPDATE_POD = MAIN_URL + "/PodTransaction/UpdatePOD"
    static public let INSERT_POD = MAIN_URL + "/PodTransaction/InsertPOD"
    static public let UPLOAD_POD_IMAGE = MAIN_URL + "/PodTransaction/UploadImageData"
    
    //Route Arrival
    static public let ROUTE_CODE = MAIN_URL + "/TrnRouteArrival/GetArrivedRouteNData"
    static public let ROUTE_LIST = MAIN_URL + "/TrnRouteArrival/GetGridForSelectedRoute"
    static public let ROUTE_BR_LIST = MAIN_URL + "/TrnRouteArrival/GetBaggageDataFromRoute"
    static public let GET_MANIFEST_LIST = MAIN_URL + "/TrnRouteArrival/GetManifestDataFromBR"
    static public let GET_MANIFEST_DETAILS = MAIN_URL + "/TrnRouteArrival/GetWaybillDataFromMF"
    static public let INSERT_ARRIVING_ROUTE = MAIN_URL + "/TrnRouteArrival/InsertArrivingRoute"
    
    //WayBill
    static public let WAY_BILL_SEARCH_DROP_DOWN = MAIN_URL + "/WayBillTransaction/GetWaybillListDropDown"
    static public let WAY_BILL_SEARCH_LIST = MAIN_URL + "/WayBillTransaction/WayBillListSearch"
    static public let CONSIGNEE_BY_DESTINATION = MAIN_URL + "/WayBillTransaction/ConsigneeByDestination"
    static public let WAY_BILL_CREATE_DROP_DOWN = MAIN_URL + "/WayBillTransaction/GetAllWayBillDropdown"
    
    //Reports Manifest
    static public let MANIFEST_SEARCH_DROP_DOWN = MAIN_URL + "/CommonDropdown/ManifestReportAllDropdown"
    static public let MANIFEST_SEARCH_LIST = MAIN_URL + "/ManifestReport/ManifestGridData"
    static public let MANIFEST_REPORT = MAIN_URL + "/ManifestReport/GetManifestReport"
    
    //Reports Baggage
    static public let BAGGAGE_SEARCH_LIST = MAIN_URL + "/BaggageReport/BaggageGridData"
    static public let BAGGAGE_REPORT = MAIN_URL + "/BaggageReport/BaggageReport"
    
    //Reports Load Revenuew
    static public let LOADREVENUE_DIVISION_DROPDOWN = MAIN_URL + "/WayBillReport/WayBillReportGridData"
    static public let LOADREVENUE_REGION_DROPDOWN = MAIN_URL + "/CommonDropdown/RegionDropDown"
    static public let LOADREVENUE_AREA_DROPDOWN = MAIN_URL + "/CommonDropdown/AreaDropDown"
    static public let LOADREVENUE_BRANCH_DROPDOWN = MAIN_URL + "/CommonDropdown/BranchDropDown"
    static public let LOADREVENUE_OPBRANCH_DROPDOWN = MAIN_URL + "/CommonDropdown/OpBranchDropDown"
    static public let LOADREVENUE_CARRIERVENDOR_DROPDOWN = MAIN_URL + "/CommonDropdown/CarrierVendorDropDown"
    static public let LOADREVENUE_SEARCH_CRITERIA_DROPDOWN = MAIN_URL + "/WayBillTransaction/GetAllWayBillDropdown"
    
    static public let LOADREVENUE_REPORT = MAIN_URL + "/RevenueReport/RevenueList"
    static public let LOADREVENUE_REPORT_WEBVIEW = MAIN_URL + "/RevenueReport/RevenueList"
   
    //Report Way Bill
    static public let WAYBILL_DIVISION_DROPDOWN = MAIN_URL + "/WayBillReport/WayBillReportGridData"
    static public let WAYBILL_REGION_DROPDOWN = MAIN_URL + "/CommonDropdown/RegionDropDown"
    static public let WAYBILL_AREA_DROPDOWN = MAIN_URL + "/CommonDropdown/AreaDropDown"
    static public let WAYBILL_BRANCH_DROPDOWN = MAIN_URL + "/CommonDropdown/BranchDropDown"
    static public let WAYBILL_OPBRANCH_DROPDOWN = MAIN_URL + "/CommonDropdown/OpBranchDropDown"
    static public let WAYBILL_REPORT_SEARCH_DROPDOWN = MAIN_URL + "CommonDropdown/GetWaybillReportAllDropDown"
   
    static public let WAYBILL_STATUS_DROPDOWN = MAIN_URL + "/WayBillTransaction/GetWaybillListDropDown"
    static public let WAYBILL_PRODUCT_DROPDOWN = MAIN_URL + "/WayBillTransaction/GetProductFromService"
    static public let WAYBILL_REPORT_SEARCH_LIST = MAIN_URL + "/WayBillTransaction/WayBillListSearch"
    
    static public let WAYBILL_REPORT = MAIN_URL + "/WayBillReport/WayBillList"
    static public let WAYBILL_REPORT_WEBVIEW = MAIN_URL + "/WayBillReport/WayBillList"
    
    //Report Bill Register
    static public let BILL_REGISTER_DIVISION_DROPDOWN = MAIN_URL + "/WayBillReport/WayBillReportGridData"
    static public let BILL_REGISTER_REGION_DROPDOWN = MAIN_URL + "/CommonDropdown/RegionDropDown"
    static public let BILL_REGISTER_AREA_DROPDOWN = MAIN_URL + "/CommonDropdown/AreaDropDown"
    static public let BILL_REGISTER_BRANCH_DROPDOWN = MAIN_URL + "/CommonDropdown/BranchDropDown"
    static public let BILL_REGISTER_OPBRANCH_DROPDOWN = MAIN_URL + "/CommonDropdown/OpBranchDropDown"
    static public let BILL_REGISTER_CONSIGNOR_DROPDOWN = MAIN_URL + "/CommonDropdown/GetBillCNRegisterDropDownListData"
    
    static public let BILL_REGISTER_REPORT = MAIN_URL + "/BillRegisterReport/BillRegisterDisplayReport"
    static public let BILL_REGISTER_REPORT_WEBVIEW = MAIN_URL + "/BillRegisterReport/BillRegisterDisplayReport"
    
   
}
