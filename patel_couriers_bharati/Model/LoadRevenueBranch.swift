//
//  LoadRevenueBranch.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 25/07/23.
//

import Foundation
class LoadRevenueBranch {
    
    public var branchId: String = ""
    public var areaId: String = ""
    public var branchCode: String = ""
    public var drabCode: String = ""
    public var iataCode: String = ""
    public var branchName: String = ""
    public var branchHead: String = ""
    public var address: String = ""
    public var pin: String = ""
    public var cityId: String = ""
    public var phone: String = ""
    public var fax: String = ""
    public var tanNo: String = ""
    public var stn: String = ""
    public var email: String = ""
    public var isLedgerFinal: String = ""
    public var userId: String = ""
    public var dateStamp: String = ""
    public var chargeWeight: String = ""
    public var faCode: String = ""
    public var ownershipCode: String = ""
    public var weDate: String = ""
    public var oracleServiceTaxRegNo: String = ""
    public var oracleServiceTaxRegNoHidden: String = ""
    public var oracleOrgLocation: String = ""
    public var gstin: String = ""
    public var ownership_code: String = ""
    public var stateName: String = ""
    public var service_Id: String = ""
    public var delivery_Area: String = ""
  
    
   
  
    init(json: JSON) {
        self.branchId = json["branchId"].stringValue
        self.areaId = json["areaId"].stringValue
        self.branchCode = json["branchCode"].stringValue
        self.drabCode = json["drabCode"].stringValue
        self.iataCode = json["iataCode"].stringValue
        self.branchName = json["branchName"].stringValue
        self.branchHead = json["branchHead"].stringValue
        self.address = json["address"].stringValue
        self.pin = json["pin"].stringValue
        self.cityId = json["cityId"].stringValue
        self.phone = json["phone"].stringValue
        self.fax = json["fax"].stringValue
        self.tanNo = json["tanNo"].stringValue
        self.stn = json["stn"].stringValue
        self.email = json["email"].stringValue
        self.isLedgerFinal = json["isLedgerFinal"].stringValue
        self.userId = json["userId"].stringValue
        self.dateStamp = json["dateStamp"].stringValue
        self.chargeWeight = json["chargeWeight"].stringValue
        self.faCode = json["faCode"].stringValue
        self.ownershipCode = json["ownershipCode"].stringValue
        self.weDate = json["weDate"].stringValue
        self.oracleServiceTaxRegNo = json["oracleServiceTaxRegNo"].stringValue
        self.oracleServiceTaxRegNoHidden = json["oracleServiceTaxRegNoHidden"].stringValue
        self.oracleOrgLocation = json["oracleOrgLocation"].stringValue
        self.gstin = json["gstin"].stringValue
        self.ownership_code = json["ownership_code"].stringValue
        self.stateName = json["stateName"].stringValue
        self.service_Id = json["service_Id"].stringValue
        self.delivery_Area = json["delivery_Area"].stringValue
    
        
    }
}
