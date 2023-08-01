//
//  LoadRevenueDivision.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 25/07/23.
//

import Foundation
class LoadRevenueDivision {
    
    public var regionId: String = ""
    public var regionShortName: String = ""
    public var divname: String = ""
    public var location: String = ""
    public var today: String = ""
    public var areaId: String = ""
    public var areaName: String = ""
    public var branchId: String = ""
    public var branchName: String = ""
    public var opBranchId: String = ""
    public var opBranchCode: String = ""
    public var opBranchName: String = ""
    public var chargeWeight: String = ""
    public var isACBranch: String = ""
    public var serviceId: String = ""
    public var serviceIdList: String = ""
    public var stateName: String = ""
    public var serviceCheck: String = ""
    public var divisionId: String = ""
    public var companyId: String = ""
    public var companyIdHidden: String = ""
    public var divisionCode: String = ""
    public var divisionName: String = ""
    public var divisionShortName: String = ""
    public var divisionHead: String = ""
    public var address: String = ""
    public var pin: String = ""
    public var cityId: String = ""
    public var phone: String = ""
    public var fax: String = ""
    public var email: String = ""
    public var basisToCalculateWt: String = ""
    public var basisToCalculateWtHidden: String = ""
    public var userId: String = ""
    public var dateStamp: String = ""
    public var panNo: String = ""
    public var oracleSbuid: String = ""
    public var oracleSbuidHidden: String = ""
  

    init(json: JSON) {
        self.regionId = json["regionId"].stringValue
        self.regionShortName = json["regionShortName"].stringValue
        self.divname = json["divname"].stringValue
        self.location = json["location"].stringValue
        self.today = json["today"].stringValue
        self.areaId = json["areaId"].stringValue
        self.areaName = json["areaName"].stringValue
        self.branchId = json["branchId"].stringValue
        self.branchName = json["branchName"].stringValue
        self.opBranchId = json["opBranchId"].stringValue
        self.opBranchCode = json["opBranchCode"].stringValue
        self.opBranchName = json["opBranchName"].stringValue
        self.chargeWeight = json["chargeWeight"].stringValue
        self.isACBranch = json["isACBranch"].stringValue
        self.serviceId = json["serviceId"].stringValue
        self.serviceIdList = json["serviceIdList"].stringValue
        self.stateName = json["stateName"].stringValue
        self.serviceCheck = json["serviceCheck"].stringValue
        self.divisionId = json["divisionId"].stringValue
        self.companyId = json["companyId"].stringValue
        self.companyIdHidden = json["companyIdHidden"].stringValue
        self.divisionCode = json["divisionCode"].stringValue
        self.divisionName = json["divisionName"].stringValue
        self.divisionShortName = json["divisionShortName"].stringValue
        self.divisionHead = json["divisionHead"].stringValue
        self.address = json["address"].stringValue
        self.pin = json["pin"].stringValue
        self.cityId = json["cityId"].stringValue
        self.phone = json["phone"].stringValue
        self.fax = json["fax"].stringValue
        self.email = json["email"].stringValue
        self.basisToCalculateWt = json["basisToCalculateWt"].stringValue
        self.basisToCalculateWtHidden = json["basisToCalculateWtHidden"].stringValue
        self.userId = json["userId"].stringValue
        self.dateStamp = json["dateStamp"].stringValue
        self.panNo = json["panNo"].stringValue
        self.oracleSbuid = json["oracleSbuid"].stringValue
        self.oracleSbuidHidden = json["oracleSbuidHidden"].stringValue
   
    }
}

