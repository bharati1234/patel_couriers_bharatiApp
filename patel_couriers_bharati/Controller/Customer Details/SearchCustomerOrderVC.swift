//
//  SearchCustomerOrderVC.swift
//  patel_couriers_bharati
//
//  Created by WindHans on 01/08/23.
//

import UIKit

class SearchCustomerOrderVC: UIViewController, DateTimePickerDelegate {
    
    @IBOutlet weak var txtWaybillNo: DTTextField!
    @IBOutlet weak var txtAirWaybillNo: DTTextField!
    @IBOutlet weak var ddConsigner: DropDown!
    @IBOutlet weak var ddDestination: DropDown!
    @IBOutlet weak var txtFromDate: DTTextField!
    @IBOutlet weak var txtToDate: DTTextField!
    @IBOutlet weak var mainView: UIView!
   
    var pick_type_start_date = 1, pick_type_end_date = 2
    var startDate = Date()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search Customer Order"
       
        txtFromDate.text! = DateTimeFormat.shared.convertDate(date: Date(), dateFormat: DateTimeFormat.shared.dateFormat6)
        txtToDate.text! = DateTimeFormat.shared.convertDate(date: Date(), dateFormat: DateTimeFormat.shared.dateFormat6)
    }
    

    @IBAction func btnSearchTapAction(_ sender: Any) {
    }
   
    @IBAction func btnFromDataTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DateTimePicker", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "DateTimePickerVC") as! DateTimePickerVC
        myAlert.delegate = self
        myAlert.selctionType = 1 //1= datePicker 2 = time picker
        myAlert.maxDate = 1
        myAlert.picktype = pick_type_start_date
        myAlert.selected_date = DateTimeFormat.shared.convertDate(date: txtFromDate.text!, dateFormat: DateTimeFormat.shared.dateFormat6)
        myAlert.modalPresentationStyle = .overCurrentContext
        myAlert.modalTransitionStyle = .crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
    @IBAction func btnToDateTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DateTimePicker", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "DateTimePickerVC") as! DateTimePickerVC
        myAlert.delegate = self
        myAlert.selctionType = 1 //1= datePicker 2 = time picker
        myAlert.maxDate = 1
        myAlert.picktype = pick_type_end_date
        //myAlert.date = startDate
        myAlert.selected_date = DateTimeFormat.shared.convertDate(date: txtToDate.text!, dateFormat: DateTimeFormat.shared.dateFormat6)
        myAlert.modalPresentationStyle = .overCurrentContext
        myAlert.modalTransitionStyle = .crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func SelectDateTime(selectedDateTime: String, selectionType: Int, picktype: Int, date: Date) {
        
        if picktype == pick_type_start_date{
            startDate = date
            txtFromDate.text! = selectedDateTime
            //tfToDate.text! = selectedDateTime
        }else{
            txtToDate.text! = selectedDateTime
            
            //postBoostDateCount = Calendar.current.dateComponents([.day], from: startDate, to: date).day! + 1
            //lblTotalDays.text! = "Total Days: \(String(describing: postBoostDateCount))"
        }
    }

}
