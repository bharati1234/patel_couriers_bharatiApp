//
//  ManifestListData.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 24/07/23.
//

import Foundation
class ManifestListData {
    
    public var manifestId: String = ""
    public var destination: String = ""
    public var manifestNumber: String = ""
    public var orgOpBranchId: String = ""
  
  
    init(json: JSON) {
        self.manifestId = json["manifestId"].stringValue
        self.destination = json["destination"].stringValue
        self.manifestNumber = json["manifestNumber"].stringValue
        self.orgOpBranchId = json["orgOpBranchId"].stringValue
     
    }
}
