//
//  ValidationManager.swift
//  Quantamax
//
//  Created by Swapnil Dhavan on 10/03/19.
//  Copyright © 2019 Swapnil Dhavan. All rights reserved.
//

import Foundation
import UIKit

enum Alerts {
    case success
    case failure
    case error
}

enum Valid {
    case success
    case failure(Alerts, AlertMessage)
}

enum ValidationType {
    case email
    case stringWithFirstLetterCaps
    case phoneNo
    case alphabeticString
    case password
    case empty_string
    case empty_no
    case invalid_username
    case field_Required
    case invalid_age
    case invalid_dob
}

enum RegEx: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" // Email
    case password = "^.{4,15}$" // Password length 6-15
    case alphabeticStringWithSpace = "^[a-zA-Z0-9 ]*$" // e.g. hello
    case alphabeticStringFirstLetterCaps = "^[A-Z]+[a-zA-Z ]*$" // SandsHell
    case phoneNo = "[0-9]{6,15}" // PhoneNo 6-14 Digits
    case otpNo = "[0-9]{6}"
    case age = "^([1-9][0-9])$" //Age Validation 18 to 99
    case alphabeticString = "[A-Z0-9a-z._%+-: ]*$" // e.g. hello
    case dob = "^[0-1][0-9]+\\/[0-3][0-9]+\\/[0-9][0-9][0-9][0-9]" // e.g. hello
    
    //Change RegEx according to your Requirement
    
   // ^(?:1[01][0-9]|120|1[7-9]|[2-9][0-9])$
    //1[7-9] covers numbers between 17 and 19
    //[2-9][0-9] covers numbers between 20 and 99
    //1[01][0-9] covers numbers between 100 and 119
    //and 120 covers the number... 120
}

enum AlertMessage: String {
    case inValidEmail = "InvalidEmail"
    case invalidFirstLetterCaps = "First Letter should be capital"
    case inValidPhone = "Invalid Mobile Number"
    case invalidAlphabeticString = "Invalid String"
    case inValidPSW = "Please Insert Valid Password"
    
    case emptyPhone = "Enter Valid Mobile Number"
    case emptyEmail = "Empty Email"
    case emptyFirstLetterCaps = "Empty Name"
    case emptyAlphabeticString = "Empty String"
    case emptyPSW = "Invalid Password"
    case emptyNo = "Empty Number"
    case fieldRequired = "Field Required"
    case invalidUsename = "Please Insert Valid Username"
    case invalidOTP = "Please Insert Valid OTP"
    case invalidAge = "Age should be 10 and above"
    case invalidDOB = "Please Enter Valid Dob"
    func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

class Validation: NSObject {
    
    public static let shared = Validation()
    
    func validate(values: (type: ValidationType, textField: DTTextField)...) -> Valid {
        
        for valueToBeChecked in values {
            
            switch valueToBeChecked.type {
            case .email:
                if let tempValue = isValidString((valueToBeChecked.textField, .email, .emptyEmail, .inValidEmail)) {
                    return tempValue
                }
            case .stringWithFirstLetterCaps:
                if let tempValue = isValidString((valueToBeChecked.textField, .alphabeticStringFirstLetterCaps, .emptyFirstLetterCaps, .invalidFirstLetterCaps)) {
                    return tempValue
                }
            case .phoneNo:
                if let tempValue = isValidString((valueToBeChecked.textField, .phoneNo, .emptyPhone, .inValidPhone)) {
                    return tempValue
                }
            case .alphabeticString:
                if let tempValue = isValidString((valueToBeChecked.textField, .alphabeticString, .emptyAlphabeticString, .invalidAlphabeticString)) {
                    return tempValue
                }
            case .password:
                if let tempValue = isValidString((valueToBeChecked.textField, .password, .emptyPSW, .inValidPSW)) {
                    return tempValue
                }
            case .empty_string:
                if let tempValue = isValidString((valueToBeChecked.textField, .otpNo, .emptyNo, .invalidAlphabeticString)) {
                    return tempValue
                }
            case .empty_no:
                if let tempValue = isValidString((valueToBeChecked.textField, .otpNo, .emptyNo, .invalidOTP)) {
                    return tempValue
                }
            case .field_Required:
                if let tempValue = isValidString((valueToBeChecked.textField, .alphabeticString, .fieldRequired, .fieldRequired)) {
                    return tempValue
                }
                
            case .invalid_username:
                if let tempValue = isValidString((valueToBeChecked.textField,.alphabeticStringWithSpace,.invalidUsename,.invalidAlphabeticString)) {
                    return tempValue
                }
            case .invalid_age:
                if let tempValue = isValidString((valueToBeChecked.textField,.age,.fieldRequired,.invalidAge)) {
                    return tempValue
                }
            case .invalid_dob:
                if let tempValue = isValidString((valueToBeChecked.textField,.dob,.emptyAlphabeticString,.invalidDOB)) {
                    return tempValue
                }
            }
        }
        return .success
    }
    
    func isValidString(_ input: (textField: DTTextField, regex: RegEx, emptyAlert: AlertMessage, invalidAlert: AlertMessage)) -> Valid? {
        
        //input.textField.layer.borderColor = UIColor.red.cgColor
        //input.textField.layer.cornerRadius = 5.0
        //input.textField.layer.borderWidth = 2.0
        let text: String = input.textField.text!
        
        if text.isEmpty {
            //input.textField.attributedPlaceholder = NSAttributedString(string: input.emptyAlert.rawValue, attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            input.textField.showError(message: input.emptyAlert.rawValue)
            input.textField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 4, revert: true)
            
            return .failure(.error, input.emptyAlert)
        } else if isValidRegEx(text, input.regex) != true {
            //input.textField.attributedPlaceholder = NSAttributedString(string: input.invalidAlert.rawValue, attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            input.textField.showError(message: input.invalidAlert.rawValue)
            input.textField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 4, revert: true)
            return .failure(.error, input.invalidAlert)
        }
        input.textField.layer.borderColor = UIColor.clear.cgColor
        input.textField.layer.borderWidth = 2.0
        return nil
    }
    
    func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
    
}



