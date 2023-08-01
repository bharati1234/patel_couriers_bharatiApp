//
//  Constants.swift
//  DrawableExample
//
//  Created by Alap Soni on 30/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    
    static let shared = Constants()
    
    let GOOGLE_MAPS_API_KEY = "AIzaSyC59-lDNkr0kZ-pVmCO-o_bkPPf9U74cl0" //Yojna poultry
    //let GOOGLE_MAPS_API_KEY = "AIzaSyAx_ipsiWt9n0qefebf3UtUEpI2LZ3l3H0" //Yojna poultry restricted
    
    
    let RAZOR_PAY_KEY = "rzp_live_xo8WDr6D2qg1wH" //New Live Key
    let APP_URL = "https://apps.apple.com/us/app/id1616316190"
    
    //color codes
    let COLOR_BROWN = 0x630614
    //let COLOR_ORANGE = 0xFD8164
    let COLOR_ORANGE = 0xAA796C //0xD4B5A6
    
    
   // let COLOR_BROWN = 0x630614
    //let COLOR_BLUE = 0x3289D9
    //let COLOR_ORANGE = 0xFD8164
    
    let CLR_New_Order = 0xF4E484
    let CLR_InProcess_Order = 0x86D4F6
    let CLR_OutForDelivery = 0x000000
    let CLR_Order_Delivered = 0x88CA51
    let CLR_Cancel_Order = 0xEE767C

    let RS = "\u{20B9} "
    let USER_ID = "userID"
    let USER_NAME = "userName"
    let OP_BRANCH_ID = "opBranchId"
    let OP_BRANCH_CODE = "opBranchCode"
    let BRANCH_ID = "branchId"
    let BRANCH_NAME = "branchName"
    let DIVISION_ID = "divisionId"
    let REGION_ID = "regionId"
    let AREA_ID = "areaId"
    let CONSIGNOR_ID = "consignorId"
    let EMAIL_ID = "emailId"
    
    
    let ID = "id"
    let CART_COUNT = "cart_count"
    let LANGUAGE = "language"
    
    func loadImg(imgName: String,imageView: UIImageView, DefaultImg: UIImage) -> Void {
    
        DispatchQueue.main.async() {
           // imageView.setTemplateWithSubviews(true, viewBackgroundColor: .white)
        }
        
        if imgName.isEmpty{
            imageView.image = DefaultImg
            return
        }
        
        let url = URL(string: imgName)!
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            
            if (error != nil) {
                print("error: ", error)
                DispatchQueue.main.async() {
                    imageView.image = DefaultImg
                   // imageView.setTemplateWithSubviews(false)
                }
                return
            }
            guard let httpresponse = response as? HTTPURLResponse,
                  (200...299).contains(httpresponse.statusCode) else {
                LoadingOverlay.shared.hideOverlayView()
                print ("server error")
                DispatchQueue.main.async() {
                    imageView.image = DefaultImg
                  //  imageView.setTemplateWithSubviews(false)
                }
                return
            }
            
            if let data = data {
                DispatchQueue.main.async() {
                    if let image = UIImage(data: data) {
                        imageView.image = image
                    }else{
                        imageView.image = DefaultImg
                    }
                   // imageView.setTemplateWithSubviews(false)
                }
            }
            
        }.resume()
        
       /* AF.request(imgName).responseImage { response in
            if let image = response.value {
                imageView.image = image
            }else {
                imageView.image = DefaultImg
            }
        }*/
    }
    func loadButtonImg(imgName: String,button: UIButton, DefaultImg: UIImage) -> Void {
        
        if imgName.isEmpty{
            button.setImage(DefaultImg, for: .normal)
           return
        }
        let url = URL(string: imgName)!
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            
            if (error != nil) {
                print(error)
                DispatchQueue.main.async() {
                    button.setImage(DefaultImg, for: .normal)
                }
                return
            }
            guard let httpresponse = response as? HTTPURLResponse,
                  (200...299).contains(httpresponse.statusCode) else {
                LoadingOverlay.shared.hideOverlayView()
                print ("server error")
                DispatchQueue.main.async() {
                    button.setImage(DefaultImg, for: .normal)
                }
                return
            }
            
            if let data = data {
                DispatchQueue.main.async() {
                    button.setImage(UIImage(data: data), for: .normal)
                }
            }
            
        }.resume()
       /* AF.request(imgName).responseImage { response in
            if let image = response.value {
                button.setImage(image, for: .normal)
            }else {
                button.setImage(DefaultImg, for: .normal)
            }
        }*/
    }
    
    func loadSharedImg(imgName: String, completion: @escaping (Data?) -> Void) {
    
        if imgName.isEmpty{
            return
        }
        
        let url = URL(string: imgName)!
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            
            if (error != nil) {
                print("error: ", error)
                return
            }
            guard let httpresponse = response as? HTTPURLResponse,
                  (200...299).contains(httpresponse.statusCode) else {
                LoadingOverlay.shared.hideOverlayView()
                print ("server error")
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
            
        }.resume()
        
       /* AF.request(imgName).responseImage { response in
            if let image = response.value {
                imageView.image = image
            }else {
                imageView.image = DefaultImg
            }
        }*/
    }
    
//    func menuItem(menuBtn: UIBarButtonItem, reaveal: SWRevealViewController, sview: UIView) -> Void {
//        menuBtn.image =  Constants.shared.image(UIImage(named: "menu")!, scaledToSize: CGSize(width: 30, height: 30))
//        menuBtn.target = reaveal;
//        menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
//        sview.addGestureRecognizer(reaveal.panGestureRecognizer())
//    }
    func Convert(str:String)-> String{
        return str.localizableString(loc: Pref.getPref(key: Constants.shared.LANGUAGE) as! String)
    }
    
    func timeConvert(time: Int) -> String {
        // Log.d("my_tag", "timeConvert:123 " + time / 60 % 24 + " " + time + " " + time / 60);
        // Log.d("my_tag", "timeConvert123: " + time);
        var t: String = "";
        var day: Int!, hour: Int!, minute: Int!;
        day = time / 3600;
        hour = (time % 3600) / 60;
        minute = (time % 3600) % 60;
        
        if (day > 0) {
            if (day < 2){
                t = String(day) + " Day ";}
            else {t = String(day) + " Days ";}
        }
        
        /* if (hour > 0)
         {t = t + String(hour) + " Hour ";}*/
        
        if (hour > 0)
        {
            if (hour < 2){
                t = t + String(hour) + " Hour ";}
            else{
                t = t + String(hour) + " Hours ";}
        }
        
        /* if (minute > 0)
         {t = t + String(minute) + " min";}*/
        
        if (minute < 2){
            t = t + String(minute) + " Minute";}
        else{
            t = t + String(minute) + " Minutes";}
        
        return t;
    }
    
    //Image function
    func image(_ originalImage:UIImage, scaledToSize:CGSize) -> UIImage {
        if originalImage.size.equalTo(scaledToSize) {
            return originalImage
        }
        UIGraphicsBeginImageContextWithOptions(scaledToSize, false, 0.0)
        originalImage.draw(in: CGRect(x: 0, y: 0, width: scaledToSize.width, height: scaledToSize.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension UITextField {
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(named: "ic_password_visible"), for: .normal)
        }else{
            button.setImage(UIImage(named: "ic_password_invisible"), for: .normal)
        }
    }
    
    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
}

extension Calendar {
    static let iso8601 = Calendar(identifier: .iso8601)
}
extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
    
    var currentWeekMonday: Date {
        return Calendar.iso8601.date(from: Calendar.iso8601.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
    }
}

extension UIImageView{
    func roundedImage(radius: Int){
        
        /*let maskPath1 = UIBezierPath(roundedRect: bounds,
         byRoundingCorners: [.topLeft , .topRight],
         cornerRadii: CGSize(width: radius, height: radius))
         let maskLayer1 = CAShapeLayer()
         maskLayer1.path = maskPath1.cgPath
         layer.mask = maskLayer1
         super.layoutSubviews()
         layoutIfNeeded()*/
    }
}

extension UIViewController {
    func HideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }
}

extension UIViewController {
    func ActionBack(menuBtn: UIBarButtonItem) {
        menuBtn.target = self
        //menuBtn.action = #selector(Back)
        menuBtn.image = Constants.shared.image(UIImage(named: "back")!, scaledToSize: CGSize(width: 20,height: 20))
    }
    func ActionBackNormal(menuBtn: UIBarButtonItem) {
        menuBtn.target = self
        menuBtn.action = #selector(BackNormal)
        menuBtn.image = Constants.shared.image(UIImage(named: "back")!, scaledToSize: CGSize(width: 20,height: 20))
    }
    
//    @objc func Back(){
//        let revealViewController:SWRevealViewController = self.revealViewController()
//        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main",bundle: nil)
//        let desController: UIViewController = mainStoryBoard.instantiateViewController(withIdentifier: "ViewController")as! ViewController
//        let newFrontViewController = UINavigationController.init(rootViewController:desController)
//        revealViewController.pushFrontViewController(newFrontViewController, animated: true)
//        //self.navigationController?.popViewController(animated: true)
//        //self.navigationController?.popToRootViewController(animated: true)
//    }
    @objc func BackNormal(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func SetCartMenu() {
        
        // badge label
        var badge_label = UILabel()
        badge_label = UILabel(frame: CGRect(x: 20, y: -5, width: 22, height: 22))
        badge_label.layer.borderColor = UIColor.clear.cgColor
        badge_label.layer.borderWidth = 2
        badge_label.layer.cornerRadius = badge_label.bounds.size.height / 2
        badge_label.textAlignment = .center
        badge_label.layer.masksToBounds = true
        badge_label.font = UIFont.boldSystemFont(ofSize: 12)
        badge_label.textColor = .white
        badge_label.backgroundColor = UIColor(rgb: Constants.shared.COLOR_ORANGE)
        badge_label.text = Pref.getPref(key: Constants.shared.CART_COUNT) as? String
        
        if (Pref.getPref(key: Constants.shared.CART_COUNT) as? String) == "0"{
            badge_label.isHidden = true
        }else{
            badge_label.isHidden = false
        }
        
        // button
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        if #available(iOS 13.0, *) {
            rightButton.setBackgroundImage(Constants.shared.image(UIImage(named: "ic_cart_one")!.withTintColor(.black, renderingMode: .alwaysTemplate), scaledToSize: CGSize(width: 30,height: 30)), for: .normal)
        } else {
            rightButton.setBackgroundImage(Constants.shared.image(UIImage(named: "ic_cart_one")!, scaledToSize: CGSize(width: 30,height: 30)), for: .normal)
        }
        rightButton.addTarget(self, action: #selector(rightButtonTouched), for: .touchUpInside)
        rightButton.addSubview(badge_label)
        
        // Bar button item
        let rightBarButtomItem = UIBarButtonItem(customView: rightButton)
        
        let user_id = (Pref.getPref(key: Constants.shared.ID) as? String)
        if user_id != nil{
            navigationItem.rightBarButtonItem = rightBarButtomItem
        }
    }
    
    @objc func rightButtonTouched() {
        if (Pref.getPref(key: Constants.shared.CART_COUNT) as? String) != "0"{
           // let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Cart",bundle: nil)
           // let desC = mainStoryBoard.instantiateViewController(withIdentifier: "MyCartVC") as! MyCartVC
          //  self.navigationController?.pushViewController(desC, animated: true)
        }else{
            self.popupAlert(title: "Attention!!!", message: "Cart is empty", actions: nil)
        }
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}


//No Internet connection singleton method
extension UIViewController {
    func noInternet() -> Bool{
        if Reachability.isConnectedToNetwork(){
            //print("Internet Connection Available!")
        }else{
            let alert = UIAlertController(title: "No Internet Connection", message: "No Working Connection Detected!\n Kindly check connectivity. ", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { action in
                self.viewDidAppear(true)
            }))
            self.present(alert, animated: true, completion: nil)
            return true
        }
        return false
    }
}


//Custom alert Dialog
extension UIViewController {
    /*func AlertDialog(msg: String, isBtnNo: Bool, completion: @escaping (Bool) -> Void) -> Void {
     
     let storyboard = UIStoryboard(name: "CustomAlert", bundle: nil)
     let myAlert = storyboard.instantiateViewController(withIdentifier: "CustomAlertVC") as! CustomAlertVC
     myAlert.contentText = msg
     myAlert.isBtnNo = isBtnNo
     myAlert.buttonAction = completion
     
     myAlert.modalPresentationStyle = .overCurrentContext
     myAlert.modalTransitionStyle = .crossDissolve
     self.present(myAlert, animated: true, completion: nil)
     
     /*  //SCLAlertView().showWarning(Constants.APP_NAME,subTitle: "No Internet Connection")
     let alert = UIAlertController(title: Constants.APP_NAME, message: msg, preferredStyle: UIAlertController.Style.alert)
     //alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
     //self.dismiss(animated: true, completion: nil)
     //}))
     self.present(alert, animated: true, completion: nil)*/
     }*/
    
    func popupMessageAlert(title: String?, message: String?, actionTitles:String?, isCancelBtn:Bool?, actions:((Bool)->())?) {
        /*var tle  = title
        if title == nil {
            tle = "Attention!!!"
        }
        let alert = UIAlertController(title: tle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitles, style: .default, handler: actions)
        alert.addAction(action)
        if isCancelBtn! {
            let action1 = UIAlertAction(title: "Cancel", style: .default, handler: nil)
            alert.addAction(action1)
        }
        self.present(alert, animated: true, completion: nil)*/
        
        let mainStoryBoard = UIStoryboard(name: "AlertDialogue",bundle: nil)
        
        let myAlert = mainStoryBoard.instantiateViewController(withIdentifier: "CustomAlertDialogVC") as! CustomAlertDialogVC
        myAlert.message = message!
        //myAlert.isHideBtnNegative = isCancelBtn!
        myAlert.buttonAction = actions
        
        if title != nil{
            myAlert.ttl = title!
        }else{
            myAlert.ttl = "Confirmation"
        }
        if actionTitles != nil{
            myAlert.btnTextPositive = actionTitles!
        }
       // if NegativeBtnTitle != nil{
            myAlert.btnTextNegative = "Cancel"
       // }
        myAlert.modalPresentationStyle = .overCurrentContext
        myAlert.modalTransitionStyle = .crossDissolve
        myAlert.providesPresentationContextTransitionStyle = true
        myAlert.definesPresentationContext = true
        self.present(myAlert, animated: true, completion: nil)
        
    }
    
    func popupAlert(title: String?, message: String?, actions:((Bool)->())?) {
       /* var tle  = title
        if title == nil {
            tle = "Attention!!!"
        }
        let alert = UIAlertController(title: tle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: actions)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)*/
        
        let mainStoryBoard = UIStoryboard(name: "AlertDialogue",bundle: nil)
        let myAlert = mainStoryBoard.instantiateViewController(withIdentifier: "CustomAlertDialogVC") as! CustomAlertDialogVC
        //if !errTitle.isEmpty{
         //   myAlert.errorTitle = errTitle
       // }
        myAlert.message = message!
        myAlert.isHideBtnNegative = true
        myAlert.isHideErrorOopsMsg = true
        myAlert.buttonAction = actions
        
        myAlert.ttl = "Alert"
        //myAlert.ttl = title!
        myAlert.btnTextPositive = "OK"
        
        //myAlert.modalPresentationStyle = .fullScreen
        myAlert.modalPresentationStyle = .overCurrentContext
        myAlert.modalTransitionStyle = .crossDissolve
        myAlert.providesPresentationContextTransitionStyle = true
        myAlert.definesPresentationContext = true
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func setText(data: String, text_size: Int) -> NSAttributedString{
        
        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: \(text_size)\">%@</span>", data)
        
        let attrStr = try! NSAttributedString(
            data: modifiedFont.data(using: .unicode, allowLossyConversion: true)!,
            options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue],
            documentAttributes: nil)
        //attrStr?.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 15) , range: NSRange(location: 0, length: (attrStr?.string.count)!))
        
        //tvHelpText.attributedText = attrStr
        return attrStr
    }
    
    func setText(data: String) -> NSAttributedString{
        
        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: \(15)\">%@</span>", data)
        
        let attrStr = try! NSAttributedString(
            data: modifiedFont.data(using: .unicode, allowLossyConversion: true)!,
            options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue],
            documentAttributes: nil)
        //attrStr?.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 15) , range: NSRange(location: 0, length: (attrStr?.string.count)!))
        
        //tvHelpText.attributedText = attrStr
        return attrStr
    }
    
    func setText17(data: String) -> NSAttributedString{
        
        let modifiedFont = String(format:"<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: \(17)\">%@</span>", data)
        
        let attrStr = try! NSAttributedString(
            data: modifiedFont.data(using: .unicode, allowLossyConversion: true)!,
            options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue],
            documentAttributes: nil)
        //attrStr?.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 15) , range: NSRange(location: 0, length: (attrStr?.string.count)!))
        
        //tvHelpText.attributedText = attrStr
        return attrStr
    }
    
}

extension UIView {
    func setShadowView() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 5.0
    }
}

extension UIView {
    func addBorderTop(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: 0, width: frame.width, height: size, color: color)
    }
    func addBorderBottom(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: frame.height - size, width: frame.width, height: size, color: color)
    }
    func addBorderLeft(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: 0, width: size, height: frame.height, color: color)
    }
    func addBorderRight(size: CGFloat, color: UIColor) {
        addBorderUtility(x: frame.width - size, y: 0, width: size, height: frame.height, color: color)
    }
    private func addBorderUtility(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: x, y: y, width: width, height: height)
        layer.addSublayer(border)
    }
}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

extension UITextView {
    func centerVertically() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }
}
//Curved View
extension UIView {
    
    /* Usage Example
     * bgView.addBottomRoundedEdge(desiredCurve: 1.5)
     */
    func addBottomRoundedEdge(desiredCurve: CGFloat?) {
        let offset: CGFloat = self.frame.width / desiredCurve!
        let bounds: CGRect = self.bounds
        
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)
        
        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath
        
        // Set the newly created shape layer as the mask for the view's layer
        self.layer.mask = maskLayer
        
        /* self.layer.shadowColor = UIColor.black.cgColor
         self.layer.shadowOffset = CGSize(width: 1,height: 1)
         //let shadowPath = UIBezierPath(ovalIn: ovalBounds)
         self.layer.shadowPath = rectPath.cgPath
         self.layer.shadowOpacity = Float(0.3)*/
    }
}

struct AppFontName {
    /*static let light = "Campton-ExtraLight"
    static let regular = "Campton-Book"
    static let semibold = "Campton-Medium"
    static let italic = "Campton-Light"*/
    
    /*static let light = "CeraPro-Light"
    static let regular = "CeraPro-Light"
    static let semibold = "CeraPro-Medium"
    static let italic = "CeraPro-Light"*/
    
    
    static let light = "Poppins-Light"
    static let regular = "Poppins-Regular"
    static let semibold = "Poppins-Medium"
    static let italic = "Poppins-Regular"
    
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    
    @objc class func mySystemFont(ofSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        switch weight {
        case .semibold, .bold, .heavy, .black:
            return UIFont(name: AppFontName.semibold, size: ofSize)!
            
        case .medium, .regular:
            return UIFont(name: AppFontName.regular, size: ofSize)!
            
        default:
            return UIFont(name: AppFontName.regular, size: ofSize)!
        }
    }
    
    @objc class func mySystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regular, size: size)!
    }
    
    @objc class func myBoldSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.semibold, size: size)!
    }
    
    @objc class func myItalicSystemFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.italic, size: size)!
    }
    
    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
        switch fontAttribute {
        case "CTFontRegularUsage", "CTFontMediumUsage":
            fontName = AppFontName.regular
        case "CTFontEmphasizedUsage", "CTFontBoldUsage", "CTFontSemiboldUsage","CTFontHeavyUsage", "CTFontBlackUsage":
            fontName = AppFontName.semibold
        case "CTFontObliqueUsage":
            fontName = AppFontName.italic
        default:
            fontName = AppFontName.regular
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }
    
    class func overrideInitialize() {
        guard self == UIFont.self else { return }
        
        if let systemFontMethodWithWeight = class_getClassMethod(self, #selector(systemFont(ofSize: weight:))),
            let mySystemFontMethodWithWeight = class_getClassMethod(self, #selector(mySystemFont(ofSize: weight:))) {
            method_exchangeImplementations(systemFontMethodWithWeight, mySystemFontMethodWithWeight)
        }
        
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(mySystemFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        
        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(myBoldSystemFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }
        
        if let italicSystemFontMethod = class_getClassMethod(self, #selector(italicSystemFont(ofSize:))),
            let myItalicSystemFontMethod = class_getClassMethod(self, #selector(myItalicSystemFont(ofSize:))) {
            method_exchangeImplementations(italicSystemFontMethod, myItalicSystemFontMethod)
        }
        
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))),
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}

extension NSAttributedString {
    func trimmedAttributedString() -> NSAttributedString {
        let invertedSet = CharacterSet.whitespacesAndNewlines.inverted
        let startRange = string.rangeOfCharacter(from: invertedSet)
        let endRange = string.rangeOfCharacter(from: invertedSet, options: .backwards)
        guard let startLocation = startRange?.lowerBound, let endLocation = endRange?.lowerBound else {
            return self
        }
        let range = NSRange(startLocation...endLocation, in: string)
        return attributedSubstring(from: range)
    }
}

class ImageBarButton : UIView {
    var imageView: UIImageView!
    var button: UIButton!
    
    convenience init(withUrl imageURL: String? = nil, withImage image: UIImage? = nil, frame: CGRect = CGRect(x: 0, y: 0, width: 35, height: 35)) {
        self.init(frame: frame)
        
        imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: "user")
        //imageView.backgroundColor = .white
        imageView.layer.cornerRadius = frame.height/2
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        
        button = UIButton(frame: frame)
        button.backgroundColor = .clear
        button.setTitle("", for: .normal)
        addSubview(button)
        
        Constants.shared.loadImg(imgName: imageURL!, imageView: imageView, DefaultImg: UIImage(named: "user")!)
        
    }
    
    func load()-> UIBarButtonItem {
        return UIBarButtonItem(customView: self)
    }
}

class LocalisableLabel: UILabel {
    
    @IBInspectable var localisedKey: String? {
        didSet {
            guard localisedKey != nil else { return }
            //text = NSLocalizedString(key, comment: "")
            text = localisedKey?.localizableString(loc: Pref.getPref(key: Constants.shared.LANGUAGE) as! String)
        }
    }
}

class LocalisableTextField: UITextField {
    
    @IBInspectable var localisedKey: String? {
        didSet {
            guard localisedKey != nil else { return }
            //text = NSLocalizedString(key, comment: "")
            placeholder = localisedKey?.localizableString(loc: Pref.getPref(key: Constants.shared.LANGUAGE) as! String)
        }
    }
}

class LocalisableButton: UIButton {
    
    @IBInspectable var localisedKey: String? {
        didSet {
            guard localisedKey != nil else { return }
            //text = NSLocalizedString(key, comment: "")
            setTitle(localisedKey?.localizableString(loc: Pref.getPref(key: Constants.shared.LANGUAGE) as! String), for: .normal)
        }
    }
}

class LocalisableTabBar: UITabBarItem {
    
    @IBInspectable var localisedKey: String? {
        didSet {
            guard localisedKey != nil else { return }
            //text = NSLocalizedString(key, comment: "")
            title = localisedKey?.localizableString(loc: Pref.getPref(key: Constants.shared.LANGUAGE) as! String)
        }
    }
}

extension String {
    func localizableString(loc: String) -> String{
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}


// Conform any type of UIView to ShimmeringViewProtocol that will be animated while shimmering.
/*extension UILabel: ShimmeringViewProtocol { }
extension UISwitch: ShimmeringViewProtocol { }
extension UIProgressView: ShimmeringViewProtocol { }
extension UITextView: ShimmeringViewProtocol { }
extension UIButton: ShimmeringViewProtocol { }
extension UITextField: ShimmeringViewProtocol { }
extension UIStepper: ShimmeringViewProtocol { }
extension UISlider: ShimmeringViewProtocol { }
extension CardView: ShimmeringViewProtocol { }
extension UIImageView: ShimmeringViewProtocol { }*/
