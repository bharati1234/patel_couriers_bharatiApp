//
//  ManiFestSearchVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 14/07/23.
//

import UIKit

class ManiFestSearchVC: UIViewController {

    @IBOutlet weak var txtManifestNo: DTTextField!
    
    var manifestNumber = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Manifest Search"
       
        //print("manifestNumber in viewDidLoad: \(manifestNumber)")
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        txtManifestNo.text = manifestNumber
    }
    

    @IBAction func btnSearchTap(_ sender: Any) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Manifest",bundle: nil)
        let manifestNumberHelpVC = mainStoryBoard.instantiateViewController(withIdentifier: "ManifestNumberHelpVC") as! ManifestNumberHelpVC
        self.navigationController?.pushViewController(manifestNumberHelpVC, animated: true)
        
    }
    
    
    @IBAction func btnSearchReportTap(_ sender: Any) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Manifest",bundle: nil)
        let manifestReportVC = mainStoryBoard.instantiateViewController(withIdentifier: "ManifestReportVC") as! ManifestReportVC
        manifestReportVC.manifestNumber = manifestNumber
        self.navigationController?.pushViewController(manifestReportVC, animated: true)
        
    }
}
