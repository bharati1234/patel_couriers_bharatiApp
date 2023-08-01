//
//  LoadingOverlay.swift
//  DrawableExample
//
//  Created by Alap Soni on 07/10/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation
import UIKit

public class LoadingOverlay{
    
    var overlayView : UIView!
    var mainView : UIView!
    var activityIndicator : UIActivityIndicatorView!
    var imageView : UIImageView!
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    init(){
        //self.mainView = UIView()
        self.overlayView = UIView()
        self.activityIndicator = UIActivityIndicatorView()
        self.imageView = UIImageView()
        
        //overlayView = UIView(frame: UIScreen.main.bounds)
        mainView = UIView(frame: UIScreen.main.bounds)
        mainView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        self.overlayView = UIView(frame: CGRect(x: mainView.frame.origin.x, y: mainView.frame.origin.y, width: mainView.frame.width, height: mainView.frame.height))
        overlayView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        //overlayView.backgroundColor = UIColor.white
        
        /*if  let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let window = appDelegate.window {
            overlayView.frame = CGRect(x: 0, y: 0, width: 180, height: 130)
            overlayView.center = CGPoint(x: window.frame.width / 2,y: window.frame.height / 2)
            overlayView.backgroundColor = .white
            overlayView.clipsToBounds = true
            overlayView.layer.cornerRadius = 10
            overlayView.layer.zPosition = 1
        }
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        //activityIndicator.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor).isActive = true
        //activityIndicator.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 16).isActive = true
        activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2,y: overlayView.bounds.height / 2)
        activityIndicator.style = .gray
        activityIndicator.transform = CGAffineTransform.init(scaleX: 2, y: 2)
        overlayView.addSubview(activityIndicator)
        
        let label = UILabel()
        label.text = "Loading Please Wait..."
        label.textColor = UIColor.black
        overlayView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 5).isActive = true
        label.centerXAnchor.constraint(equalTo: activityIndicator.centerXAnchor).isActive = true*/
        
        imageView.image = UIImage(named: "loader_image")
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 150)
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.center = CGPoint(x: overlayView.bounds.width / 2,y: overlayView.bounds.height / 2)
        //imageView.loadGif(name: "loader")
        //activityIndicator.style = .whiteLarge
        overlayView.addSubview(imageView)
        
        mainView.addSubview(overlayView)
    }
    
    public func showOverlay() {
       // overlayView.center = view.center
        UIApplication.shared.keyWindow?.addSubview(mainView)
        activityIndicator.startAnimating()
    }
    
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        mainView.removeFromSuperview()
    }
}
