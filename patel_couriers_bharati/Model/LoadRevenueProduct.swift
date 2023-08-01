//
//  LoadRevenueProduct.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 25/07/23.
//

import Foundation
class LoadRevenueProduct {
    
    public var serviceProductId: String = ""
    public var serviceId: String = ""
    public var productId: String = ""
    public var productCode: String = ""
    public var productName: String = ""
  
    init(json: JSON) {
        self.serviceProductId = json["serviceProductId"].stringValue
        self.serviceId = json["serviceId"].stringValue
        self.productId = json["productId"].stringValue
        self.productCode = json["productCode"].stringValue
        self.productName = json["productName"].stringValue
    
    }
}

