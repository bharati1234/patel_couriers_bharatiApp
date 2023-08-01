//
//  WayBillProduct.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 26/07/23.
//

import Foundation
class WayBillProduct {
    
    public var productId: String = ""
    public var productCode: String = ""
    public var productName: String = ""
    public var productStatus: String = ""
    public var mode: String = ""
   
    init(json: JSON) {
        self.productId = json["productId"].stringValue
        self.productCode = json["productCode"].stringValue
        self.productName = json["productName"].stringValue
        self.productStatus = json["productStatus"].stringValue
        self.mode = json["mode"].stringValue
     
    }
}
