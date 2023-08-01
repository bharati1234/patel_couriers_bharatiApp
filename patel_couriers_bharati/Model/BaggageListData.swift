//
//  BaggageListData.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 24/07/23.
//

import Foundation
class BaggageListData {
    
    public var brid: String = ""
    public var destination: String = ""
    public var brnumber: String = ""
    public var origin: String = ""
  
    init(json: JSON) {
        self.brid = json["brid"].stringValue
        self.destination = json["destination"].stringValue
        self.brnumber = json["brnumber"].stringValue
        self.origin = json["origin"].stringValue
     
    }
}

