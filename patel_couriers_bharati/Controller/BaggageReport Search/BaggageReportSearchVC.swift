//
//  BaggageReportSearchVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 19/07/23.
//

import UIKit

class BaggageReportSearchVC: UIViewController {

   var brNumber = ""
    @IBOutlet weak var txtBRNumber: DTTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Baggage Report Search"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        txtBRNumber.text = brNumber
        
    }

    @IBAction func btnSearchTap(_ sender: Any) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Baggage",bundle: nil)
        let baggageReportnumberhelpVC = mainStoryBoard.instantiateViewController(withIdentifier: "BaggageReportNumberHelpVC") as! BaggageReportNumberHelpVC
        self.navigationController?.pushViewController(baggageReportnumberhelpVC, animated: true)
        
    }
    
    @IBAction func btnSearchByFilterTap(_ sender: Any) {
        if txtBRNumber.text == ""{
            let reason: String = "Please Enter Baggage Report Number! "
            self.popupAlert(title: nil, message: reason, actions: nil)
        }else {
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Baggage",bundle: nil)
            let baggageReportVC = mainStoryBoard.instantiateViewController(withIdentifier: "BaggageReportVC") as! BaggageReportVC
            baggageReportVC.pnBrnumber = brNumber
            baggageReportVC.pnBrnumber = txtBRNumber.text!
            self.navigationController?.pushViewController(baggageReportVC, animated: true)
        }
    }
    

    
    
    

}
