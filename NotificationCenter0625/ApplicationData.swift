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
    
    mutating func addNewName(newName: String) {
        names.append(newName)
        
        let center = NotificationCenter.default
        let name = Notification.Name("Update Data")
        center.post(name: name, object: nil, userInfo: nil)
    }
}

var AppData = ApplicationData(names: [])
