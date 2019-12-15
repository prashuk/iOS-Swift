//
//  ViewController.swift
//  NSNotification
//
//  Created by Prashuk Ajmera on 12/14/19.
//  Copyright © 2019 Prashuk Ajmera. All rights reserved.
//

import UIKit

class ChooseDestinationViewController: UIViewController {

    @IBOutlet weak var cityLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(setToMumbai(notification:)), name: .mumbai, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setToBangalore(notfication:)), name: .bangalore, object: nil)
    }

    @objc func setToMumbai(notification: NSNotification) {
         cityLbl.text = "Mumbai"
    }
    
    @objc func setToBangalore(notfication: NSNotification) {
         cityLbl.text = "Bangalore"
    }
    
}

extension Notification.Name {
    static let mumbai = Notification.Name(rawValue: "Mumbai")
    static let bangalore = Notification.Name(rawValue: "Bangalore")
}
