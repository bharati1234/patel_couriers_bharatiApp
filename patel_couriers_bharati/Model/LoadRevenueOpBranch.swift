//
//  LoadRevenueOpBranch.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 25/07/23.
//

import Foundation
class LoadRevenueOpBranch {
    
    public var opBranchId: String = ""
    public var branchId: String = ""
    public var opBranchCode: String = ""
    public var opBranchName: String = ""
    public var opBranchHead: String = ""
    public var address: String = ""
    public var pin: String = ""
    public var cityId: String = ""
    public var phone: String = ""
    public var fax: String = ""
    public var email: String = ""
    public var minPickupWeight: String = ""
    public var basisToCalculateWt: String = ""
    public var basisToCalculateWtHidden: String = ""
    public var userId: String = ""
    public var dateStamp: String = ""
    public var isACBranch: String = ""
    public var oracleLocationId: String = ""
    public var oracleLocationIdHidden: String = ""
    public var opbr: String = ""
    public var opbrid: String = ""
    public var date: String = ""
    public var isCheck: String = ""
    public var column1: String = ""
    public var stateName: String = ""
    
  
    init(json: JSON) {
        self.opBranchId = json["opBranchId"].stringValue
        self.branchId = json["branchId"].stringValue
        self.opBranchCode = json["opBranchCode"].stringValue
        self.opBranchName = json["opBranchName"].stringValue
        self.opBranchHead = json["opBranchHead"].stringValue
        self.address = json["address"].stringValue
        self.pin = json["pin"].stringValue
        self.cityId = json["cityId"].stringValue
        self.phone = json["phone"].stringValue
        self.fax = json["fax"].stringValue
        self.email = json["email"].stringValue
        self.minPickupWeight = json["minPickupWeight"].stringValue
        self.basisToCalculateWt = json["basisToCalculateWt"].stringValue
        self.basisToCalculateWtHidden = json["basisToCalculateWtHidden"].stringValue
        self.userId = json["userId"].stringValue
        self.dateStamp = json["dateStamp"].stringValue
        self.isACBranch = json["isACBranch"].stringValue
        self.oracleLocationId = json["oracleLocationId"].stringValue
        self.oracleLocationIdHidden = json["oracleLocationIdHidden"].stringValue
        self.opbr = json["opbr"].stringValue
        self.opbrid = json["opbrid"].stringValue
        self.date = json["date"].stringValue
        self.isCheck = json["isCheck"].stringValue
        self.column1 = json["column1"].stringValue
        self.stateName = json["stateName"].stringValue
    
    }
}

