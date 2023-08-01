//
//  TrackReportVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 01/08/23.
//

import UIKit

class TrackReportVC: UIViewController {

    @IBOutlet weak var txtNumber: DTTextField!
    @IBOutlet weak var btnWaybillNumber: UIButton!
    @IBOutlet weak var btnManifestNumber: UIButton!
    @IBOutlet weak var btnBaggagerptNo: UIButton!
    @IBOutlet weak var btnBRAirWaybillNo: UIButton!
    @IBOutlet weak var btnAirwaybillNo: UIButton!
    @IBOutlet weak var btnStockFinder: UIButton!
    
    var selectedNumberOptions = ""
    var selectedRadioImage:UIImage?
    var unSelectedRadioImage:UIImage?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tracking Report" 
        setRadioBtnImage()
    }
    func setRadioBtnImage(){
        selectedRadioImage = UIImage(systemName: "circle.inset.filled")
        unSelectedRadioImage = UIImage(systemName: "circle")
        
        // Set the default selection
        btnWaybillNumber.isSelected = true
        btnManifestNumber.isSelected = false
        btnBaggagerptNo.isSelected = false
        btnBRAirWaybillNo.isSelected = false
        btnAirwaybillNo.isSelected = false
        btnStockFinder.isSelected = false
      
        
        // Set the images for both selected and normal states for All buttons
        btnWaybillNumber.setImage(selectedRadioImage, for: .selected)
        btnWaybillNumber.setImage(unSelectedRadioImage, for: .normal)
        
        btnManifestNumber.setImage(selectedRadioImage, for: .selected)
        btnManifestNumber.setImage(unSelectedRadioImage, for: .normal)
        
        btnBaggagerptNo.setImage(selectedRadioImage, for: .selected)
        btnBaggagerptNo.setImage(unSelectedRadioImage, for: .normal)
        
        btnBRAirWaybillNo.setImage(selectedRadioImage, for: .selected)
        btnBRAirWaybillNo.setImage(unSelectedRadioImage, for: .normal)
        
        btnAirwaybillNo.setImage(selectedRadioImage, for: .selected)
        btnAirwaybillNo.setImage(unSelectedRadioImage, for: .normal)
        
        btnStockFinder.setImage(selectedRadioImage, for: .selected)
        btnStockFinder.setImage(unSelectedRadioImage, for: .normal)
    }
    @IBAction func btnWaybillNumberActionTapped(_ sender: UIButton) {
        
        sender.isSelected = true
        
        btnManifestNumber.isSelected = false
        btnBaggagerptNo.isSelected = false
        btnBRAirWaybillNo.isSelected = false
        btnAirwaybillNo.isSelected = false
        btnStockFinder.isSelected = false
        
        selectedNumberOptions = "WayBill Number"
        // Set the images for the selected and normal states
        btnWaybillNumber.setImage(selectedRadioImage, for: .selected)
        btnWaybillNumber.setImage(unSelectedRadioImage, for: .normal)
        print("Selected Option: \(selectedNumberOptions)")
        
    }
    @IBAction func btnManifestNumberActionTapped(_ sender: UIButton) {
        
        sender.isSelected = true
        
        btnWaybillNumber.isSelected = false
        btnBaggagerptNo.isSelected = false
        btnBRAirWaybillNo.isSelected = false
        btnAirwaybillNo.isSelected = false
        btnStockFinder.isSelected = false
        
        selectedNumberOptions = "Manifest Number"
        // Set the images for the selected and normal states
        btnManifestNumber.setImage(selectedRadioImage, for: .selected)
        btnManifestNumber.setImage(unSelectedRadioImage, for: .normal)
        print("Selected Option: \(selectedNumberOptions)")
        
    }
    @IBAction func btnBaggagerptNoActionTapped(_ sender: UIButton) {
        
        sender.isSelected = true
        
        btnWaybillNumber.isSelected = false
        btnManifestNumber.isSelected = false
        btnBRAirWaybillNo.isSelected = false
        btnAirwaybillNo.isSelected = false
        btnStockFinder.isSelected = false
        
        selectedNumberOptions = "Baggage Report Number"
        // Set the images for the selected and normal states
        btnBaggagerptNo.setImage(selectedRadioImage, for: .selected)
        btnBaggagerptNo.setImage(unSelectedRadioImage, for: .normal)
        print("Selected Option: \(selectedNumberOptions)")
        
    }
    @IBAction func btnBRAirWaybillNoActionTapped(_ sender: UIButton) {
        
        sender.isSelected = true
        
        btnWaybillNumber.isSelected = false
        btnManifestNumber.isSelected = false
        btnBaggagerptNo.isSelected = false
        btnAirwaybillNo.isSelected = false
        btnStockFinder.isSelected = false
        
        selectedNumberOptions = "BR/AirWaybill Number"
        // Set the images for the selected and normal states
        btnBRAirWaybillNo.setImage(selectedRadioImage, for: .selected)
        btnBRAirWaybillNo.setImage(unSelectedRadioImage, for: .normal)
        print("Selected Option: \(selectedNumberOptions)")
        
    }
    @IBAction func btnAirwaybillNoActionTapped(_ sender: UIButton) {
        
        sender.isSelected = true
        
        btnWaybillNumber.isSelected = false
        btnManifestNumber.isSelected = false
        btnBaggagerptNo.isSelected = false
        btnBRAirWaybillNo.isSelected = false
        btnStockFinder.isSelected = false
        
        selectedNumberOptions = "AirwayBill Number"
        // Set the images for the selected and normal states
        btnAirwaybillNo.setImage(selectedRadioImage, for: .selected)
        btnAirwaybillNo.setImage(unSelectedRadioImage, for: .normal)
        print("Selected Option: \(selectedNumberOptions)")
        
    }
    @IBAction func btnStockFinderActionTapped(_ sender: UIButton) {
        
        sender.isSelected = true
        
        btnWaybillNumber.isSelected = false
        btnManifestNumber.isSelected = false
        btnBaggagerptNo.isSelected = false
        btnBRAirWaybillNo.isSelected = false
        btnAirwaybillNo.isSelected = false
        
        selectedNumberOptions = "Stock Finder"
        // Set the images for the selected and normal states
        btnStockFinder.setImage(selectedRadioImage, for: .selected)
        btnStockFinder.setImage(unSelectedRadioImage, for: .normal)
        print("Selected Option: \(selectedNumberOptions)")
        
    }
    @IBAction func btnTrackActionTap(_ sender: Any) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "TRACK",bundle: nil)
        let trackingReportWebViewVC = mainStoryBoard.instantiateViewController(withIdentifier: "TrackingReportWebViewVC") as! TrackingReportWebViewVC
        self.navigationController?.pushViewController(trackingReportWebViewVC, animated: true)
        
    }
    
}
