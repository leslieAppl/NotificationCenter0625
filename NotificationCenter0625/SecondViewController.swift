//
//  SecondViewController.swift
//  NotificationCenter0625
//
//  Created by leslie on 6/25/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func saveBtnPressed(_ sender: UIButton) {
        if let value = name.text {
            if value != "" {            
                AppData.addNewName(newName: value)
            }
        }
        name.text = ""
        
        navigationController?.popViewController(animated: true)
    }
    
}
