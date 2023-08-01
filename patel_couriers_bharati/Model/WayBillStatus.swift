//
//  WayBillStatus.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 26/07/23.
//

import Foundation
class WayBillStatus {
    
    public var oracalstatus: String = ""
    public var waybillStatusId: String = ""
    public var waybillstatusName: String = ""
    public var wbStatusRptName: String = ""
   
    init(json: JSON) {
        self.oracalstatus = json["oracalstatus"].stringValue
        self.waybillStatusId = json["waybillStatusId"].stringValue
        self.waybillstatusName = json["waybillstatusName"].stringValue
        self.wbStatusRptName = json["wbStatusRptName"].stringValue
    }
}
