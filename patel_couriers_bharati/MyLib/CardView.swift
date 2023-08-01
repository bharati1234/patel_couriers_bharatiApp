//
//  CardView.swift
//  DrawableExample
//
//  Created by Alap Soni on 20/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {
    
    @IBInspectable var cornerradius : CGFloat = 10
    @IBInspectable var shadowOffSetWidth : CGFloat = 1
    @IBInspectable var shadowOffSetHeight : CGFloat = 1
    @IBInspectable var shadowColor : UIColor = UIColor.black
    @IBInspectable var shadowOpacity : CGFloat = 0.3
    @IBInspectable var borderColor : UIColor = UIColor.black
    @IBInspectable var borderWidth : CGFloat = 1
    @IBInspectable var type : CGFloat = 1
    
    override func layoutSubviews() {
        
        if type == 1 {
            layer.cornerRadius = cornerradius
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowOffSetWidth,height: shadowOffSetHeight)
            let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
            layer.shadowPath = shadowPath.cgPath
            layer.shadowOpacity = Float(shadowOpacity)
        }else if type == 2{
            let path =  UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight,.bottomRight], cornerRadii: CGSize(width: cornerradius, height: cornerradius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            layer.mask = maskLayer
            
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowOffSetWidth,height: shadowOffSetHeight)
            layer.shadowPath = path.cgPath
            layer.shadowOpacity = Float(shadowOpacity)
        }else if type == 3{
            let path =  UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft,.bottomRight], cornerRadii: CGSize(width: cornerradius, height: cornerradius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            layer.mask = maskLayer
            
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowOffSetWidth,height: shadowOffSetHeight)
            layer.shadowPath = path.cgPath
            layer.shadowOpacity = Float(shadowOpacity)
        }else if type == 4{
            let path =  UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: cornerradius, height: cornerradius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            layer.mask = maskLayer
            
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowOffSetWidth,height: shadowOffSetHeight)
            layer.shadowPath = path.cgPath
            layer.shadowOpacity = Float(shadowOpacity)
        }/*else if type == 5{
            let path =  UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: cornerradius, height: cornerradius))
            path.addArc(withCenter: CGPoint(x: self.layer.frame.width, y: self.layer.frame.height/2),
                              radius: 30/2,
                              startAngle: CGFloat(90).toRadians(),
                              endAngle: CGFloat(270).toRadians(),
                              clockwise: true)
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            layer.mask = maskLayer
            
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowOffSetWidth,height: shadowOffSetHeight)
            layer.shadowPath = path.cgPath
            layer.shadowOpacity = Float(shadowOpacity)
        }*/else{
            layer.cornerRadius = cornerradius
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = borderWidth
        }
        
    }
}
