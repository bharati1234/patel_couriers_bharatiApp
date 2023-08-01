//
//  WayBillRoute.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 26/07/23.
//

import Foundation
class WayBillRoute {

    public var routeSerID: String = ""
    public var serviceId: String = ""
    public var routeDetailId: String = ""
    public var carrierVendorId: String = ""
    public var eta: String = ""
    public var etd: String = ""
    public var fareType1: String = ""
    public var fareType2: String = ""
    public var fareType3: String = ""
    public var fareType4: String = ""
    public var operatingDays: String = ""
    public var operatingDaysHidden: String = ""
    public var serviceTypeId: String = ""
    public var tonnageCommitment: String = ""
    public var tonnageCommitmentFreq: String = ""
    public var tonnageCommitmentFreqHidden: String = ""
    public var penalty: String = ""
    public var isActive: String = ""
    public var baggageReportId: String = ""
    public var routeName: String = ""
    public var brNumber: String = ""
    public var opBranchCode: String = ""
    public var ackDate: String = ""
    public var routeId: String = ""
    public var routeCode: String = ""
    public var startBranchId: String = ""
    public var startHubId: String = ""
    public var destBranchId: String = ""
    public var destHubId: String = ""
    public var remark: String = ""
    public var userId: String = ""
    public var dateStamp: String = ""

  
init(json: JSON) {
    self.routeSerID = json["routeSerID"].stringValue
    self.serviceId = json["serviceId"].stringValue
    self.routeDetailId = json["routeDetailId"].stringValue
    self.carrierVendorId = json["carrierVendorId"].stringValue
    self.eta = json["eta"].stringValue
    self.etd = json["etd"].stringValue
    self.fareType1 = json["fareType1"].stringValue
    self.fareType2 = json["fareType2"].stringValue
    self.fareType3 = json["fareType3"].stringValue
    self.fareType4 = json["fareType4"].stringValue
    self.operatingDays = json["operatingDays"].stringValue
    self.operatingDaysHidden = json["operatingDaysHidden"].stringValue
    self.serviceTypeId = json["serviceTypeId"].stringValue
    self.tonnageCommitment = json["tonnageCommitment"].stringValue
    self.tonnageCommitmentFreq = json["tonnageCommitmentFreq"].stringValue
    self.tonnageCommitmentFreqHidden = json["tonnageCommitmentFreqHidden"].stringValue
    self.penalty = json["penalty"].stringValue
    self.isActive = json["isActive"].stringValue
    self.baggageReportId = json["baggageReportId"].stringValue
    self.routeName = json["routeName"].stringValue
    self.brNumber = json["brNumber"].stringValue
    self.opBranchCode = json["opBranchCode"].stringValue
    self.ackDate = json["ackDate"].stringValue
    self.routeId = json["routeId"].stringValue
    self.routeCode = json["routeCode"].stringValue
    self.startBranchId = json["startBranchId"].stringValue
    self.startHubId = json["startHubId"].stringValue
    self.destBranchId = json["destBranchId"].stringValue
    self.destHubId = json["destHubId"].stringValue
    self.remark = json["remark"].stringValue
    self.userId = json["userId"].stringValue
    self.dateStamp = json["dateStamp"].stringValue

}
}

