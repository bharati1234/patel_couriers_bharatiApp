//
//  LoadRevenueReportWebView.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 28/07/23.
//

import Foundation
class LoadRevenueReportWebView {
    
    public var fileName: String = ""
    public var downloadFilePath: String = ""
   
    init(json: JSON) {
        self.fileName = json["fileName"].stringValue
        self.downloadFilePath = json["downloadFilePath"].stringValue
    }
}
