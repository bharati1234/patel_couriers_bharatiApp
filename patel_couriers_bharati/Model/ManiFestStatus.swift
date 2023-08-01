//
//  ManiFestStatus.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 21/07/23.
//

import Foundation
class ManiFestStatus {
    
    public var mfStatusId: String = ""
    public var mfStatusCode: String = ""
    public var mfStatusRptName: String = ""
    public var statusId: String = ""
    public var status: String = ""
  
    init(json: JSON) {
        self.mfStatusId = json["mfStatusId"].stringValue
        self.mfStatusCode = json["mfStatusCode"].stringValue
        self.mfStatusRptName = json["mfStatusRptName"].stringValue
        self.statusId = json["statusId"].stringValue
        self.status = json["status"].stringValue
     
    }
}
