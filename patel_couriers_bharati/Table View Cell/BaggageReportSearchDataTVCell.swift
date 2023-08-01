//
//  BaggageReportSearchDataTVCell.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 20/07/23.
//

import UIKit

class BaggageReportSearchDataTVCell: UITableViewCell {

    @IBOutlet weak var lblBRNumber: UILabel!
    @IBOutlet weak var lblDestination: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    func Configure(with item :BaggageListData){
        lblBRNumber.text = item.brnumber
        lblDestination.text = item.destination
    }

}
