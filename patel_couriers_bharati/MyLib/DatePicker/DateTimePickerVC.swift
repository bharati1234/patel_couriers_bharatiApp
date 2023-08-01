//
//  DatePickerVC.swift
//  JMBR Couriers
//
//  Created by Swapnil Dhavan on 08/07/19.
//  Copyright © 2019 Wind Hans Technologies. All rights reserved.
//

import UIKit
protocol DateTimePickerDelegate
{
    func SelectDateTime(selectedDateTime: String, selectionType: Int, picktype: Int, date: Date)
}
class DateTimePickerVC: UIViewController {
    
    var selctionType:Int = 0
    var datetype:Int = 0
    var picktype:Int = 0
    var delegate:DateTimePickerDelegate! = nil
    var buttonTitle = "Pick Date"
    var maxDate = 0
    var minDate = 0
    
    var date = Date()
    var selected_date = Date()
    
    @IBOutlet weak var btnPickDateTime: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        datePicker.date = selected_date
        
        if maxDate == 1{
            datePicker.maximumDate = date
        }
        if minDate == 1{
            datePicker.minimumDate = date
        }
        
        if selctionType == 1 {
            datePicker.datePickerMode = UIDatePicker.Mode.date
            /*if datetype == 1{
             btnPickDateTime.setTitle("Pick From Date", for: .normal)
             }else if datetype == 2{
             btnPickDateTime.setTitle("Pick To Date", for: .normal)
             }else{
             btnPickDateTime.setTitle("Pick Date", for: .normal)
             }*/
            
            btnPickDateTime.setTitle(buttonTitle, for: .normal)
            
        }else if selctionType == 2{
            datePicker.datePickerMode = UIDatePicker.Mode.time
            if #available(iOS 13.4, *) {
                datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
            } else {
                // Fallback on earlier versions
            }
            btnPickDateTime.setTitle("Pick Time", for: .normal)
        }else{
            datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
            btnPickDateTime.setTitle("Pick DateTime", for: .normal)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let calender: Calendar = Calendar(identifier: .gregorian)
        let weekday = calender.component(.weekday, from: sender.date)
      /*  //sunday
        if weekday == 1 {
            datePicker.setDate(Date(timeInterval: 60*60*24*1, since: sender.date), animated: true)
        } else if weekday == 7 {
            datePicker.setDate(Date(timeInterval: 60*60*24*(-1), since: sender.date), animated: true)
        }  //saturday */
    }
    
    @IBAction func btnPickDate(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        let dateFormatter = DateFormatter()
        let dt: Date = datePicker.date
        if selctionType == 1 {
            dateFormatter.dateFormat = "dd-MMM-yyyy"
        }else if selctionType == 2{
            dateFormatter.dateFormat = "hh:mm aa" 
        }else{
            dateFormatter.dateFormat = "dd-MMM-yyyy, hh:mm a"
        }
        
        popoverPresentationController?.delegate?.popoverPresentationControllerDidDismissPopover?(popoverPresentationController!)
        self.delegate.SelectDateTime(selectedDateTime: dateFormatter.string(from: dt), selectionType: selctionType, picktype: picktype, date: dt)
    }
}
