//
//  CustomerDetailsVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 01/08/23.
//

import UIKit

class CustomerDetailsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Customer Details"
        
    }
    

    @IBAction func btnCustomerOrderReceivedActionTap(_ sender: Any) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "CustomerDetails",bundle: nil)
        let searchCustomerOrderVC = mainStoryBoard.instantiateViewController(withIdentifier: "SearchCustomerOrderVC") as! SearchCustomerOrderVC
        self.navigationController?.pushViewController(searchCustomerOrderVC, animated: true)
        
    }
    
}
