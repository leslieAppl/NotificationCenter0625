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
    
    var device = UIDevice.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Add Observer to the Notification Center
        let center = NotificationCenter.default
        let name = Notification.Name("Update Data")
        center.addObserver(self, selector: #selector(self.updateCounter(notification:)), name: name, object: nil)
    }

    //TODO: Detecting the current orientation
    override func viewWillAppear(_ animated: Bool) {
        ///Generating accelerometer to detect device orientation
        device.beginGeneratingDeviceOrientationNotifications()
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(self.changeOrientation(notification:)), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        ///Close the accelerometer
        device.endGeneratingDeviceOrientationNotifications()
    }
    
    @objc func updateCounter(notification: Notification) {
        ///Observers are sometimes executed from a different thread ( asynchronously ), so we have to access the main thread to avoid conflict.
        let main = OperationQueue.main
        main.addOperation {
            
            if let info = notification.userInfo {
                ///The values from the dictionary are returned as values of type Any,
                ///so we have to cast them to the right type.
                let type = info["type"] as? String
                if type == "New Name" {
                    let current = AppData.names
                    self.counterLbl.text = String(current.count)
                }
            }
            
            //TODO: Remove Observer from the Notification Center
            //So the label is only updated once
            let center = NotificationCenter.default
            let name = Notification.Name("Update Data")
            center.removeObserver(self, name: name, object: nil)

        }
    }
    
    @objc func changeOrientation(notification: Notification) {
        let orientation = device.orientation
        switch orientation {
        case .portrait, .portraitUpsideDown:
            print("Portrait")
        case .landscapeLeft, .landscapeRight:
            print("Landscape")
        default:
            print("Underined")
        }
    }

}

