//
//  ServerErrorVC.swift
//  Fresh Fishco
//
//  Created by Swapnil Dhavan on 26/02/21.
//

import UIKit

class ServerErrorVC: UIViewController {

    @IBOutlet var backView: CardView!
    var viewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backView.layer.borderWidth = 0.5
        backView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func btnReloadTap(_ sender: Any) {
        if viewController != nil{
            viewController.viewDidAppear(true)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func btnOKTap(_ sender: Any) {
        exit(0)
    }
    
}
