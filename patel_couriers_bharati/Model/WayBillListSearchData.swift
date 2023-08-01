//
//  WayBillListSearchData.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 26/07/23.
//

import Foundation
class WayBillListSearchData {
    
    public var waybillNumber: String = ""
    public var destination: String = ""
    public var consignor: String = ""
    public var status: String = ""
    public var pieces: String = ""
    public var bags: String = ""
    public var totalCharges: String = ""
    public var actualWeight: String = ""
    public var bookingDate: String = ""

    init(json: JSON) {

        self.waybillNumber = json["waybillNumber"].stringValue
        self.destination = json["destination"].stringValue
        self.consignor = json["consignor"].stringValue
        self.status = json["status"].stringValue
        self.pieces = json["pieces"].stringValue
        self.bags = json["bags"].stringValue
        self.totalCharges = json["totalCharges"].stringValue
        self.actualWeight = json["actualWeight"].stringValue
        self.bookingDate = json["bookingDate"].stringValue
    }
}

