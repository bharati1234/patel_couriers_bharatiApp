//
//  WayBillReportSearchListTVCell.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 21/07/23.
//

import UIKit

class WayBillReportSearchListTVCell: UITableViewCell {

    
    @IBOutlet weak var lblWayBillNo: UILabel!
    @IBOutlet weak var lblAirwayNo: UILabel!
    @IBOutlet weak var lblConsignor: UILabel!
    @IBOutlet weak var lblDestination: UILabel!
    @IBOutlet weak var lblWaybillDate: UILabel!
    @IBOutlet weak var lblService: UILabel!
    @IBOutlet weak var lblPieces: UILabel!
    @IBOutlet weak var lblBags: UILabel!
    @IBOutlet weak var lblActualWeight: UILabel!
    
    @IBOutlet weak var lblProduct: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func Configure(with item :WayBillListSearchData){
        lblWayBillNo.text = item.waybillNumber
        lblConsignor.text = item.consignor
        lblDestination.text = item.destination
        lblWaybillDate.text = item.bookingDate
        lblPieces.text = item.pieces
        lblBags.text = item.bags
        lblActualWeight.text = item.actualWeight
        
    }

}
