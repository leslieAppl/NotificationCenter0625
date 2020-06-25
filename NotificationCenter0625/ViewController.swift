//
//  ViewController.swift
//  NotificationCenter0625
//
//  Created by leslie on 6/25/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = NotificationCenter.default
        let name = Notification.Name("Update Data")
        center.addObserver(self, selector: #selector(self.updateCounter(notifigation:)), name: name, object: nil)
    }

    @objc func updateCounter(notifigation: Notification) {
        ///Observers are sometimes executed from a different thread ( asynchronously ), so we have to access the main thread to avoid conflict.
        let main = OperationQueue.main
        main.addOperation {
            let current = AppData.names
            self.counterLbl.text = String(current.count)
        }
    }

}

