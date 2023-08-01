//
//  LoadRevenueCarrierVendor.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 25/07/23.
//

import Foundation
class LoadRevenueCarrierVendor {
    
    public var carrierId: String = ""
    public var carrierCode: String = ""
    public var description: String = ""
   
    init(json: JSON) {
        self.carrierId = json["carrierId"].stringValue
        self.carrierCode = json["carrierCode"].stringValue
        self.description = json["description"].stringValue
        
    }
}
