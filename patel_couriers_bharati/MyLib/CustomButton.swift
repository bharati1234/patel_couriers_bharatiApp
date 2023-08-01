//
//  CustomButton.swift
//  DrawableExample
//
//  Created by Swapnil Dhavan on 07/01/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    /*@IBInspectable var localisedKey: String? {
        didSet {
            guard let key = localisedKey else { return }
            //text = NSLocalizedString(key, comment: "")
            setTitle(localisedKey?.localizableString(loc: Pref.getPref(key: Constants.shared.LANGUAGE) as! String), for: .normal)
        }
    }*/
    
    @IBInspectable var cornerradius : CGFloat = 10
    @IBInspectable var shadowOffSetWidth : CGFloat = 1
    @IBInspectable var shadowOffSetHeight : CGFloat = 1
    @IBInspectable var shadowColor : UIColor = UIColor.black
    @IBInspectable var shadowOpacity : CGFloat = 0.3
    @IBInspectable var shadowRadius : CGFloat = 5
    
    @IBInspectable var borderColor : UIColor = .lightGray
    @IBInspectable var borderWidth : CGFloat = 1
    @IBInspectable var type : CGFloat = 1
    
    override func awakeFromNib() {
        
       /* let gradientColor = CAGradientLayer()
        if #available(iOS 13.0, *) {
            gradientColor.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width+40, height: self.frame.size.height)
        }else{
            gradientColor.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width-55, height: self.frame.size.height)
        }
        gradientColor.cornerRadius = cornerradius
        gradientColor.colors = [UIColor(rgb: Constants.shared.COLOR_PRIMARY_DARK).cgColor,UIColor(rgb: Constants.shared.COLOR_PRIMARY_DARK).cgColor,UIColor(rgb: Constants.shared.COLOR_GRADIENT).cgColor]
        layer.insertSublayer(gradientColor, at: 0)*/
        
        /*self.layer.masksToBounds = false
        //self.layer.cornerRadius = self.frame.height/2
        self.layer.cornerRadius = cornerradius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        self.layer.shadowOpacity = Float(shadowOpacity)
        self.layer.shadowRadius = shadowRadius*/
        
        if type == 1 {
            self.layer.masksToBounds = false
            //self.layer.cornerRadius = self.frame.height/2
            self.layer.cornerRadius = cornerradius
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
            self.layer.shadowOpacity = Float(shadowOpacity)
            self.layer.shadowRadius = shadowRadius
        }else if type == 2{
            layer.cornerRadius = cornerradius
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = borderWidth
        }else if type == 3{
            layer.cornerRadius = cornerradius
            //layer.borderColor = UIColor.getPrimaryColor().cgColor
            layer.borderWidth = borderWidth
        }else if type == 4{
            layer.cornerRadius = cornerradius
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = borderWidth
           // backgroundColor = UIColor.getPrimaryColor()
        }else if type == 5{
            layer.cornerRadius = cornerradius
           // backgroundColor = UIColor.getPrimaryColor()
        }else {
           // self.layer.masksToBounds = false
            let path =  UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight], cornerRadii: CGSize(width: cornerradius, height: cornerradius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            layer.mask = maskLayer
            
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowOffSetWidth,height: shadowOffSetHeight)
            layer.shadowPath = path.cgPath
            layer.shadowOpacity = Float(shadowOpacity)
        }
        
    }
}

/* override func awakeFromNib() {
 super.awakeFromNib()
 self.layer.masksToBounds = false
 //self.layer.cornerRadius = self.frame.height/2
 self.layer.cornerRadius = 4
 self.layer.shadowColor = UIColor.lightGray.cgColor
 self.layer.shadowOffset = CGSize(width: 0, height: 3)
 self.layer.shadowOpacity = 0.5
 self.layer.shadowRadius = 5.0
 /* UIView.animate(withDuration: 0.6,
 animations: {
 self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
 },
 completion: { _ in
 UIView.animate(withDuration: 0.6) {
 self.transform = CGAffineTransform.identity
 }
 })*/
 //self.layer.shadowColor = UIColor.black.cgColor
 //self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
 //self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
 //self.layer.shadowOpacity = 0.5
 //self.layer.shadowRadius = 1.0
 }*/
    
   /* override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = false
        //self.layer.cornerRadius = self.frame.height/2
        self.layer.cornerRadius = 4
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 5.0
       /* UIView.animate(withDuration: 0.6,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            self.transform = CGAffineTransform.identity
                        }
        })*/
        //self.layer.shadowColor = UIColor.black.cgColor
        //self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        //self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        //self.layer.shadowOpacity = 0.5
        //self.layer.shadowRadius = 1.0
    }
    
}*/
