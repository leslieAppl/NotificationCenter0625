//
//  SecondViewController.swift
//  NotificationCenter0625
//
//  Created by leslie on 6/25/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveBtnPressed(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
}
