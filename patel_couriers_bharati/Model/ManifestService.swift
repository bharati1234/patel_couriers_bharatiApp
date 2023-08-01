//
//  ManifestService.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 21/07/23.
//

import Foundation
class ManifestService {
    
    public var viewControllerName: String = ""
    public var viewActionName: String = ""
    public var viewReturnUrl: String = ""
    public var serviceid: String = ""
    public var servicecode: String = ""
   
    init(json: JSON) {
        self.viewControllerName = json["viewControllerName"].stringValue
        self.viewActionName = json["viewActionName"].stringValue
        self.viewReturnUrl = json["viewReturnUrl"].stringValue
        self.serviceid = json["serviceid"].stringValue
        self.servicecode = json["servicecode"].stringValue
        
    }
}
