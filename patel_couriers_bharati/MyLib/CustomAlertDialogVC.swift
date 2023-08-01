//
//  CustomAlertDialogVC.swift
//  
//
//  Created by Swapnil Dhavan on 16/09/20.
//  Copyright © 2020 Swapnil Dhavan. All rights reserved.
//

import UIKit

class CustomAlertDialogVC: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet var lblErrorOopsMsg: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var btnPositiveAlert: UIButton!
    @IBOutlet weak var btnNegativeAlert: UIButton!
    @IBOutlet var topView: CardView!
    @IBOutlet var alertView: CardView!
    
    var ttl = ""
    var btnTextPositive = ""
    var btnTextNegative = ""
    var message = ""
    var errorTitle = ""
    
    var isHideBtnNegative: Bool = false
    var isHideErrorOopsMsg: Bool = true
    var contentText: String = ""
    var buttonAction: ((Bool)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNegativeAlert.isHidden = isHideBtnNegative
        lblErrorOopsMsg.isHidden = isHideErrorOopsMsg
        
        if !ttl.isEmpty{
            lblTitle.text! = ttl
        }
        if !btnTextPositive.isEmpty{
            btnPositiveAlert.setTitle(btnTextPositive, for: .normal)
        }
        if !btnTextNegative.isEmpty{
            btnNegativeAlert.setTitle(btnTextNegative, for: .normal)
        }
        
        //btnPositiveAlert.layer.borderWidth = 1
        //btnNegativeAlert.layer.borderWidth = 1
        //btnNegativeAlert.layer.cornerRadius = 5
        
        //btnPositiveAlert.layer.borderColor = UIColor(rgb: ConstColors.PrimaryDarkColor).cgColor
        //btnNegativeAlert.layer.borderColor = UIColor(rgb: ConstColors.PrimaryDarkColor).cgColor
        
        lblErrorOopsMsg.text! = errorTitle
        lblMessage.text! = message
        
        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let path =  UIBezierPath(roundedRect: topView.bounds, byRoundingCorners: [.topRight,.topLeft], cornerRadii: CGSize(width: 5, height: 5))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        topView.layer.mask = maskLayer
        
        topView.layoutIfNeeded()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layoutIfNeeded()
    }
    // MARK: Custom Methods
    /// To setup the view to load.
    func setupView() {
        alertView.layer.cornerRadius = 10
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    /// To animate the view when alert is shown
    func animateView() {
        alertView.alpha = 0
        self.alertView.frame.origin.y += 50
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.alertView.alpha = 1.0
            self.alertView.frame.origin.y -= 50
        })
    }
    /// To animate the view when alert is shown
    func animateCloseView() {
        UIView.animate(withDuration: 0.4, animations: {
            self.alertView.frame.origin.y += 50
            self.alertView.alpha = 0
        }, completion: { _ in
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    @IBAction func btnPositiveAlertTap(_ sender: Any) {
        animateCloseView()
        buttonAction?(true)
    }
    @IBAction func btnNegativeAlertTap(_ sender: Any) {
        animateCloseView()
        buttonAction?(false)
    }
    
    @IBAction func btnCloseTap(_ sender: Any) {
        animateCloseView()
        buttonAction?(false)
    }
    
    
}
