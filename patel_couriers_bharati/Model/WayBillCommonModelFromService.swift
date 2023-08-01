//
//  WayBillService.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 28/07/23.
//

import Foundation
class WayBillCommonModelFromService {
    
    public var serviceid: String = ""
    public var servicename: String = ""
    public var productid: String = ""
    public var productname: String = ""
    public var paymentmodeid: String = ""
    public var paymentmode: String = ""
    public var opBranchId: String = ""
    public var opBranchName: String = ""
    public var consignorId: String = ""
    public var consignorName: String = ""
    public var routeId: String = ""
    public var routeCode: String = ""
    public var rateCategoryId: String = ""
    public var rateCategoryName: String = ""
    public var statusId: String = ""
    public var statusName: String = ""
    public var consignorTypeId: String = ""
    public var consignorTypeName: String = ""
    public var groupID: String = ""
    public var groupName: String = ""
    public var documentypeId: String = ""
    public var documentTypeId: String = ""
    public var documentType: String = ""
    public var fromDate: String = ""
    public var toDate: String = ""
   
    init(json: JSON) {
        self.serviceid = json["serviceid"].stringValue
        self.servicename = json["servicename"].stringValue
        self.productid = json["productid"].stringValue
        self.productname = json["productname"].stringValue
        self.paymentmodeid = json["paymentmodeid"].stringValue
        self.paymentmode = json["paymentmode"].stringValue
        self.opBranchId = json["opBranchId"].stringValue
        self.opBranchName = json["opBranchName"].stringValue
        self.consignorId = json["consignorId"].stringValue
        self.consignorName = json["consignorName"].stringValue
        self.routeId = json["routeId"].stringValue
        self.routeCode = json["routeCode"].stringValue
        self.rateCategoryId = json["rateCategoryId"].stringValue
        self.rateCategoryName = json["rateCategoryName"].stringValue
        self.statusId = json["statusId"].stringValue
        self.statusName = json["statusName"].stringValue
        self.consignorTypeId = json["consignorTypeId"].stringValue
        self.consignorTypeName = json["consignorTypeName"].stringValue
        self.groupID = json["groupID"].stringValue
        self.groupName = json["groupName"].stringValue
        self.documentypeId = json["documentypeId"].stringValue
        self.documentTypeId = json["documentTypeId"].stringValue
        self.documentType = json["documentType"].stringValue
        self.fromDate = json["fromDate"].stringValue
        self.toDate = json["toDate"].stringValue
      
    }
}
