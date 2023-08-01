//
//  ProfileVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 01/08/23.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var btnEditProfile: UIButton!
    @IBOutlet weak var txtFullName: DTTextField!
    @IBOutlet weak var txtMobileNo: DTTextField!
    @IBOutlet weak var txtEmail: DTTextField!
    @IBOutlet weak var txtAddress: DTTextField!
    @IBOutlet weak var txtPassword: DTTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
   
    @IBAction func btnUpdateProdileActionTAp(_ sender: Any) {
    }
}
