//
//  BaggageReportData.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 25/07/23.
//

import Foundation
class BaggageReportData {
    
    public var reportOutput: String = ""
    public var downloadParameters: String = ""
   
    init(json: JSON) {
        self.reportOutput = json["reportOutput"].stringValue
        self.downloadParameters = json["downloadParameters"].stringValue
    }
}
