//
//  LoadRevenuePaymentType.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 25/07/23.
//

import Foundation
class LoadRevenuePaymentType {
    
    public var payModId: String = ""
    public var payTypeId: String = ""
    public var payMod: String = ""
    public var paymentModeId: String = ""
    public var paymentModeCode: String = ""
    public var paymentMode: String = ""
    public var paymentTypeId: String = ""
  
 
    init(json: JSON) {
        self.payModId = json["payModId"].stringValue
        self.payTypeId = json["payTypeId"].stringValue
        self.payMod = json["payMod"].stringValue
        self.paymentModeId = json["paymentModeId"].stringValue
        self.paymentModeCode = json["paymentModeCode"].stringValue
        self.paymentMode = json["paymentMode"].stringValue
        self.paymentTypeId = json["paymentTypeId"].stringValue
    
    }
}

