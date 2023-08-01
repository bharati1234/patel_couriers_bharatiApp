//
//  CardView.swift
//  DrawableExample
//
//  Created by Alap Soni on 20/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit


@IBDesignable class ImageCardView: UIImageView {
    
    @IBInspectable var cornerradius : CGFloat = 10
    @IBInspectable var shadowOffSetWidth : CGFloat = 1
    @IBInspectable var shadowOffSetHeight : CGFloat = 1
    @IBInspectable var shadowColor : UIColor = UIColor.black
    //@IBInspectable var shadowOpacity : CGFloat = 0.3
    @IBInspectable var borderColor : UIColor = UIColor.white
    @IBInspectable var borderWidth : CGFloat = 3
    @IBInspectable var shadowOpacity : CGFloat = 0
    @IBInspectable var type : CGFloat = 1
    
    /// constraint to maintain same aspect ratio as the image
    private var aspectRatioConstraint:NSLayoutConstraint? = nil
    
    // This makes it use the correct size in Interface Builder
    public override func prepareForInterfaceBuilder() {
        invalidateIntrinsicContentSize()
    }
    
    @IBInspectable
    var maxAspectRatio: CGFloat = 999 {
        didSet {
            if type == 5{
                updateAspectRatioConstraint()
            }
        }
    }
    
    @IBInspectable
    var minAspectRatio: CGFloat = 0 {
        didSet {
            if type == 5{
                updateAspectRatioConstraint()
            }
        }
    }
    
    
    override func layoutSubviews() {
        
        if type == 1 {
            layer.cornerRadius = cornerradius
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowOffSetWidth,height: shadowOffSetHeight)
            let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
            layer.shadowPath = shadowPath.cgPath
            layer.shadowOpacity = Float(shadowOpacity)
        }else if type == 2 {
            let path =  UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: cornerradius, height: cornerradius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            layer.mask = maskLayer
            
            /*layer.shadowColor = shadowColor.cgColor
             layer.shadowOffset = CGSize(width: shadowOffSetWidth,height: shadowOffSetHeight)
             layer.shadowPath = path.cgPath
             layer.shadowOpacity = Float(shadowOpacity)*/
        }else if type == 3 {
            let path =  UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft,.bottomRight], cornerRadii: CGSize(width: cornerradius, height: cornerradius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            layer.mask = maskLayer
        }else {
            layer.cornerRadius = layer.frame.height/2
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor.cgColor
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOffset = CGSize(width: shadowOffSetWidth,height: shadowOffSetHeight)
            let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.frame.height/2)
            layer.shadowPath = shadowPath.cgPath
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.setup()
    }
    
    public override init(frame:CGRect) {
        super.init(frame:frame)
        self.setup()
    }
    
    public override init(image: UIImage!) {
        super.init(image:image)
        self.setup()
    }
    
    public override init(image: UIImage!, highlightedImage: UIImage?) {
        super.init(image:image,highlightedImage:highlightedImage)
        self.setup()
    }
    
    override public var image: UIImage? {
        didSet { self.updateAspectRatioConstraint() }
    }
    
    private func setup() {
        if type == 5{
            self.updateAspectRatioConstraint()
        }
    }
    
    /// Removes any pre-existing aspect ratio constraint, and adds a new one based on the current image
    private func updateAspectRatioConstraint() {
        // remove any existing aspect ratio constraint
      /*  if let constraint = self.aspectRatioConstraint {
            self.removeConstraint(constraint)
        }
        self.aspectRatioConstraint = nil
        
        if let imageSize = image?.size, imageSize.height != 0 {
            var aspectRatio = imageSize.width / imageSize.height
            aspectRatio = max(minAspectRatio, aspectRatio)
            aspectRatio = min(maxAspectRatio, aspectRatio)
            
            let constraint = NSLayoutConstraint(item: self, attribute: .width,
                                                relatedBy: .equal,
                                                toItem: self, attribute: .height,
                                                multiplier: aspectRatio, constant: 0)
            constraint.priority = .required
            self.addConstraint(constraint)
            self.aspectRatioConstraint = constraint
        }*/
    }
}
