//
//  ManifestSearchDataTVCell.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 20/07/23.
//

import UIKit

class ManifestSearchDataTVCell: UITableViewCell {
   
    @IBOutlet weak var lblmanifestNo: UILabel!
    @IBOutlet weak var lblmanifestNumber: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func Configure(with item : ManifestListData){
        lblmanifestNo.text = String(item.manifestId)
        lblmanifestNumber.text = item.manifestNumber
    }

}
