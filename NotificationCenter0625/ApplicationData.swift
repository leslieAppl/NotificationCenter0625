//
//  ApplicationData.swift
//  NotificationCenter0625
//
//  Created by leslie on 6/25/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import Foundation

struct ApplicationData {
    var names: [String]
    
    //TODO: Posting Notification
    mutating func addNewName(newName: String) {
        names.append(newName)
        
        let center = NotificationCenter.default
        let name = Notification.Name("Update Data")
        
        ///declares a dictionary with the key "type" and the value "New Name"
        ///and assigns it to the userInfo attribute of the post() method.
        let info = ["type": "New Name"]
        center.post(name: name, object: nil, userInfo: info)
    }
}

var AppData = ApplicationData(names: [])
