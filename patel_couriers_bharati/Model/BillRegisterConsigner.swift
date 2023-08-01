//
//  BillRegisterConsigner.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 28/07/23.
//

import Foundation
class BillRegisterConsigner {
    
    public var opBranchId: String = ""
    public var opBranchName: String = ""
    public var consignorId: String = ""
    public var consignorName: String = ""
    public var description: String = ""
    public var groupID: String = ""
    public var groupName: String = ""

    init(json: JSON) {
        self.opBranchId = json["opBranchId"].stringValue
        self.opBranchName = json["opBranchName"].stringValue
        self.consignorId = json["consignorId"].stringValue
        self.consignorName = json["consignorName"].stringValue
        self.description = json["description"].stringValue
        self.groupID = json["groupID"].stringValue
        self.groupName = json["groupName"].stringValue
    }
}
