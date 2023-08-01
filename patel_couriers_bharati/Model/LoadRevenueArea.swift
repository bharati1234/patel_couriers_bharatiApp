//
//  LoadRevenueArea.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 25/07/23.
//

import Foundation
class LoadRevenueArea {
    
    public var stateName: String = ""
    public var stateId: String = ""
    public var area: String = ""
    public var areaId: String = ""
    public var regionId: String = ""
    public var areaCode: String = ""
    public var areaName: String = ""
    public var areaShortName: String = ""
    public var areaHead: String = ""
    public var address: String = ""
    public var pin: String = ""
    public var cityId: String = ""
    public var phone: String = ""
    public var fax: String = ""
    public var email: String = ""
    public var userId: String = ""
    public var dateStamp: String = ""
    
 
    init(json: JSON) {
        self.stateName = json["stateName"].stringValue
        self.stateId = json["stateId"].stringValue
        self.area = json["area"].stringValue
        self.areaId = json["areaId"].stringValue
        self.regionId = json["regionId"].stringValue
        self.areaCode = json["areaCode"].stringValue
        self.areaName = json["areaName"].stringValue
        self.areaShortName = json["areaShortName"].stringValue
        self.areaHead = json["areaHead"].stringValue
        self.address = json["address"].stringValue
        self.pin = json["pin"].stringValue
        self.cityId = json["cityId"].stringValue
        self.phone = json["phone"].stringValue
        self.fax = json["fax"].stringValue
        self.email = json["email"].stringValue
        self.userId = json["userId"].stringValue
        self.dateStamp = json["dateStamp"].stringValue
        
    }
}
