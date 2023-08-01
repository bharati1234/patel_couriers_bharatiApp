//
//  ManiFestRoute.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 21/07/23.
//

import Foundation
class ManiFestRoute {
 
    public var routeId: String = ""
    public var routeCode: String = ""
        
   
    init(json: JSON) {
        self.routeId = json["routeid"].stringValue
        self.routeCode = json["routecode"].stringValue
      
    }
}
