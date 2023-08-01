//
//  LoadRevenueDestination.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 28/07/23.
//

import Foundation
class LoadRevenueDestination {
    
    public var opBranchId: String = ""
    public var opBranchName: String = ""
    public var docIssueDate: String = ""
   
    init(json: JSON) {
        self.opBranchId = json["opBranchId"].stringValue
        self.opBranchName = json["opBranchName"].stringValue
        self.docIssueDate = json["docIssueDate"].stringValue
        
    }
}
