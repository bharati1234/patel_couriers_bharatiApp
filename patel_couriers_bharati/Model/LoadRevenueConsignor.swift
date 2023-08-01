//
//  LoadRevenueConsignor.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 25/07/23.
//

import Foundation
class LoadRevenueConsignor {
    
    public var branchId: String = ""
    public var branchName: String = ""
    public var address: String = ""
    public var pin: String = ""
    public var conType: String = ""
    public var date: String = ""
    public var contactPerson: String = ""
    public var consignorName: String = ""
    public var exciseNo: String = ""
    public var tan: String = ""
    public var pan: String = ""
    public var saleTaxNo: String = ""
    public var serviceTaxNo: String = ""
    public var phone: String = ""
    public var creditAmt: String = ""
    public var creditPeriod: String = ""
    public var applyToLogin: String = ""
    public var applyToAll: String = ""
    public var gstiN_No: String = ""
    public var fax: String = ""
    public var email: String = ""
    public var lcl_Address: String = ""
    public var lcl_Pin: String = ""
    public var lcl_CityId: String = ""
    public var lcl_StateId: String = ""
    public var bill_Address: String = ""
    public var bill_Pin: String = ""
    public var bill_CityId: String = ""
    public var bill_StateId: String = ""
    public var applicableInd: String = ""
    public var odFlag: String = ""
    public var conco: String = ""
    public var connam: String = ""
    public var conbad: String = ""
    public var conpin: String = ""
    public var consignorId: String = ""
    public var consignorCode: String = ""
    public var glCode: String = ""
    public var clCode: String = ""
    public var description: String = ""
    public var consignorTypeId: String = ""
    public var userId: String = ""
    public var dateStamp: String = ""
    public var consignorflag: String = ""
    public var conrTypeFlag: String = ""
    public var groupID: String = ""
    public var groupIDHidden: String = ""
    public var oracleGroupId: String = ""
    public var oracleGroupIdHidden: String = ""
   
    init(json: JSON) {
        self.branchId = json["branchId"].stringValue
        self.branchName = json["branchName"].stringValue
        self.address = json["address"].stringValue
        self.pin = json["pin"].stringValue
        self.conType = json["conType"].stringValue
        self.date = json["date"].stringValue
        self.contactPerson = json["contactPerson"].stringValue
        self.consignorName = json["consignorName"].stringValue
        self.exciseNo = json["exciseNo"].stringValue
        self.tan = json["tan"].stringValue
        self.pan = json["pan"].stringValue
        self.saleTaxNo = json["saleTaxNo"].stringValue
        self.serviceTaxNo = json["serviceTaxNo"].stringValue
        self.phone = json["phone"].stringValue
        self.creditAmt = json["creditAmt"].stringValue
        self.creditPeriod = json["creditPeriod"].stringValue
        self.applyToLogin = json["applyToLogin"].stringValue
        self.applyToAll = json["applyToAll"].stringValue
        self.gstiN_No = json["gstiN_No"].stringValue
        self.fax = json["fax"].stringValue
        self.email = json["email"].stringValue
        self.lcl_Address = json["lcl_Address"].stringValue
        self.lcl_Pin = json["lcl_Pin"].stringValue
        self.lcl_CityId = json["lcl_CityId"].stringValue
        self.lcl_StateId = json["lcl_StateId"].stringValue
        self.bill_Address = json["bill_Address"].stringValue
        self.bill_Pin = json["bill_Pin"].stringValue
        self.bill_CityId = json["bill_CityId"].stringValue
        self.bill_StateId = json["bill_StateId"].stringValue
        self.applicableInd = json["applicableInd"].stringValue
        self.odFlag = json["odFlag"].stringValue
        self.conco = json["conco"].stringValue
        self.connam = json["connam"].stringValue
        self.conbad = json["conbad"].stringValue
        self.conpin = json["conpin"].stringValue
        self.consignorId = json["consignorId"].stringValue
        self.consignorCode = json["consignorCode"].stringValue
        self.glCode = json["glCode"].stringValue
        self.clCode = json["clCode"].stringValue
        self.description = json["description"].stringValue
        self.consignorTypeId = json["consignorTypeId"].stringValue
        self.userId = json["userId"].stringValue
        self.dateStamp = json["dateStamp"].stringValue
        self.consignorflag = json["consignorflag"].stringValue
        self.conrTypeFlag = json["conrTypeFlag"].stringValue
        self.groupID = json["groupID"].stringValue
        self.groupIDHidden = json["groupIDHidden"].stringValue
        self.oracleGroupId = json["oracleGroupId"].stringValue
        self.oracleGroupIdHidden = json["oracleGroupIdHidden"].stringValue
       
    }
}
