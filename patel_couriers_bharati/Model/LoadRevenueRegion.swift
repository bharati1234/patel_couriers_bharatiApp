//
//  LoadRevenueRegion.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 25/07/23.
//

import Foundation
class LoadRevenueRegion {
    
    public var divisionName: String = ""
    public var abbrevation: String = ""
    public var city: String = ""
    public var state: String = ""
    public var stateName: String = ""
    public var region: String = ""
    public var regionId: String = ""
    public var divisionId: String = ""
    public var regionCode: String = ""
    public var regionName: String = ""
    public var regionShortName: String = ""
    public var regionHead: String = ""
    public var address: String = ""
    public var pin: String = ""
    public var cityId: String = ""
    public var phone: String = ""
    public var fax: String = ""
    public var email: String = ""
    public var userId: String = ""
    public var dateStamp: String = ""
   
  
    init(json: JSON) {
        self.divisionName = json["divisionName"].stringValue
        self.abbrevation = json["abbrevation"].stringValue
        self.city = json["city"].stringValue
        self.state = json["state"].stringValue
        self.stateName = json["stateName"].stringValue
        self.region = json["region"].stringValue
        self.regionId = json["regionId"].stringValue
        self.divisionId = json["divisionId"].stringValue
        self.regionCode = json["regionCode"].stringValue
        self.regionName = json["regionName"].stringValue
        self.regionShortName = json["regionShortName"].stringValue
        self.regionHead = json["regionHead"].stringValue
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
