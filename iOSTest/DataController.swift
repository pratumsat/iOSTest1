//
//  DataController.swift
//  iOSTest
//
//  Created by thnawat on 14/12/2563 BE.
//

import Foundation

class DataController {
    static var token : String {
        return UserDefaults.standard.value(forKey: "token") as! String
        
    }
    static func setToken(token:String) {
        UserDefaults.standard.set(token, forKey: "token")
    }
}
