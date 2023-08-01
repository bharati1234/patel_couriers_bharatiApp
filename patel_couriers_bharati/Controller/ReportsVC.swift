//
//  ReportsVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 14/07/23.
//

import UIKit

class ReportsVC: UIViewController {

    @IBOutlet weak var btnManifestSearch: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Reports"
    }
    

    @IBAction func btnManifestTap(_ sender: Any) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Manifest",bundle: nil)
        let manifestSearchVC = mainStoryBoard.instantiateViewController(withIdentifier: "ManiFestSearchVC") as! ManiFestSearchVC
        self.navigationController?.pushViewController(manifestSearchVC, animated: true)
        
    }
    
    
    @IBAction func btnBaggageReportTap(_ sender: Any) {
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Baggage",bundle: nil)
            let baggageReportVC = mainStoryBoard.instantiateViewController(withIdentifier: "BaggageReportSearchVC") as! BaggageReportSearchVC
            self.navigationController?.pushViewController(baggageReportVC, animated: true)
    }
   
    @IBAction func loadRevenueTap(_ sender: Any) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "LoadRevenue",bundle: nil)
        let loadRevenueVC = mainStoryBoard.instantiateViewController(withIdentifier: "LoadRevenueSearchVC") as! LoadRevenueSearchVC
        self.navigationController?.pushViewController(loadRevenueVC, animated: true)
        
    }
    
    @IBAction func btnWayBillReportTap(_ sender: Any) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Waybill",bundle: nil)
        let wayBillReportVC = mainStoryBoard.instantiateViewController(withIdentifier: "WayBillReportSearchVC") as! WayBillReportSearchVC
        self.navigationController?.pushViewController(wayBillReportVC, animated: true)
    }
   
    @IBAction func billRegisterTap(_ sender: Any) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "BillRegister",bundle: nil)
        let billRegisterReportVC = mainStoryBoard.instantiateViewController(withIdentifier: "BillRegisterVC") as! BillRegisterVC
        self.navigationController?.pushViewController(billRegisterReportVC, animated: true)
    }
    
    
}


