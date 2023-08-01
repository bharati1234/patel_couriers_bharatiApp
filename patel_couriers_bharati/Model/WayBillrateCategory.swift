//
//  WayBillrateCategory.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 26/07/23.
//

import Foundation
class WayBillrateCategory {
    
    public var rateid: String = ""
    public var ratecode: String = ""
    public var rateCategoryId: String = ""
    public var rateCategoryCode: String = ""
    public var rateCategoryName: String = ""

    init(json: JSON) {
        self.rateid = json["rateid"].stringValue
        self.ratecode = json["ratecode"].stringValue
        self.rateCategoryId = json["rateCategoryId"].stringValue
        self.rateCategoryCode = json["rateCategoryCode"].stringValue
        self.rateCategoryName = json["rateCategoryName"].stringValue
    }
}
