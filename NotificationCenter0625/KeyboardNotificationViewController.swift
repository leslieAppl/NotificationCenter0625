//
//  KeyboardNotificationViewController.swift
//  NotificationCenter0625
//
//  Created by leslie on 6/26/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class KeyboardNotificationViewController: UIViewController {

    @IBOutlet weak var heightBottom: NSLayoutConstraint!
    @IBOutlet weak var mainText: UITextView!
    var constraintHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        constraintHeight = heightBottom.constant
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(self.openKeyboard(notification:)), name: UIWindow.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(closeKeyboard(notification:)), name: UIWindow.keyboardWillHideNotification, object: nil)
    }
    
    @objc func openKeyboard(notification: Notification) {
        if let info = notification.userInfo {
            let value = info[UIWindow.keyboardFrameEndUserInfoKey] as! NSValue
            let frame = value.cgRectValue
            let newHeight = frame.size.height+constraintHeight
            heightBottom.constant = newHeight
        }
    }
    
    @objc func closeKeyboard(notification: Notification) {
        heightBottom.constant = constraintHeight
    }

    @IBAction func saveBtnPressed(_ sender: UIButton) {
        mainText.resignFirstResponder()
    }
}
