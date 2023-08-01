//
//  LoadRevenueReportData.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 28/07/23.
//

import Foundation
class LoadRevenueReportData {
    
    public var reportOutput: String = ""
    public var downloadParameters: String = ""
   
    init(json: JSON) {
        self.reportOutput = json["reportOutput"].stringValue
        self.downloadParameters = json["downloadParameters"].stringValue
    }
}
