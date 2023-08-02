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
    @IBOutlet weak var txtAddress: GrowingTextView!
    @IBOutlet weak var txtPassword: DTTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtPassword.setupPasswordField()
        
    }

    @IBAction func btnSetProfileImage(_ sender: Any) {
        ImagePicker.shared.PickImage(viewContoller: self, imageView: profileImage, completion: {(Success) in
            //self.imgPOD.isHidden = false
            //self.lblImgError.text! = ""
        })
    }
    
    @IBAction func btnChangePasswordTap(_ sender: Any) {
    }
   
    @IBAction func btnUpdateProfileActionTAp(_ sender: Any) {
        
        let fullName = txtFullName.text!
        let mobileNo = txtMobileNo.text!
        let email = txtEmail.text!
        let address = txtAddress.text!
        let password = txtPassword.text!
        
        print("fullName is: \(fullName)")
        print("mobileNo is: \(mobileNo)")
        print("email is: \(email)")
        print("address is: \(address)")
        print("password is: \(password)")
        
    }
}
