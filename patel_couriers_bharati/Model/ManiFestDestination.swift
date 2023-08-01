//
//  ManiFestDestination.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 21/07/23.
//

import Foundation
class ManiFestDestination {
    
    public var opbranchname: String = ""
    public var opbranchid: String = ""
    public var stateId: String = ""
    public var opBranchModel: String = ""
    public var viewControllerName: String = ""
    public var viewActionName: String = ""
    public var viewReturnUrl: String = ""
    public var branchDropDownListData: String = ""
    public var cityDropDownListData: String = ""
    public var stateDropDownListData: String = ""
    public var usersDropDownListData: String = ""
 
    init(json: JSON) {
        self.opbranchid = json["opbranchidstateId"].stringValue
        self.opBranchModel = json["stateIdviewControllerName"].stringValue
        self.viewActionName = json["opBranchModelviewReturnUrl"].stringValue
        self.branchDropDownListData = json["viewControllerNamecityDropDownListData"].stringValue
        self.stateDropDownListData = json["viewActionNameusersDropDownListData"].stringValue
        self.opbranchname = json["viewReturnUrlopbranchid"].stringValue
        self.stateId = json["branchDropDownListDataopBranchModel"].stringValue
        self.viewControllerName = json["cityDropDownListDataviewActionName"].stringValue
        self.viewReturnUrl = json["stateDropDownListDatabranchDropDownListData"].stringValue
        self.cityDropDownListData = json["usersDropDownListDatastateDropDownListData"].stringValue
        self.usersDropDownListData = json["opbranchnameopbranchname"].stringValue
        
    }
}

