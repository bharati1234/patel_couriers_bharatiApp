//
//  LoadRevenueService.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 25/07/23.
//

import Foundation
class LoadRevenueService {
    
    public var serviceId: String = ""
    public var serviceCode: String = ""
    public var serviceName: String = ""
    public var costCenterCode: String = ""
    public var modeId: String = ""
    public var branchId: String = ""
    public var productList: String = ""
    public var modeCode: String = ""
    public var modeName: String = ""
    public var divisionId: String = ""
    public var serviceProductId: String = ""
    public var productId: String = ""
    public var serviceCheck: String = ""
    public var service_Id: String = ""
 
  
    init(json: JSON) {
        self.serviceId = json["serviceId"].stringValue
        self.serviceCode = json["serviceCode"].stringValue
        self.serviceName = json["serviceName"].stringValue
        self.costCenterCode = json["costCenterCode"].stringValue
        self.modeId = json["modeId"].stringValue
        self.branchId = json["branchId"].stringValue
        self.productList = json["productList"].stringValue
        self.modeCode = json["modeCode"].stringValue
        self.modeName = json["modeName"].stringValue
        self.divisionId = json["divisionId"].stringValue
        self.serviceProductId = json["serviceProductId"].stringValue
        self.productId = json["productId"].stringValue
        self.serviceCheck = json["serviceCheck"].stringValue
        self.service_Id = json["service_Id"].stringValue
  
    }
}
