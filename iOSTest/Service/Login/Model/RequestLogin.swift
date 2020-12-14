//
//  RequestLogin.swift
//  iOSTest
//
//  Created by thnawat on 14/12/2563 BE.
//

import Foundation
import ObjectMapper

struct RequestLogin : Mappable {
    
    var username:String?
    var password:String?
    
    init(username: String , password:String) {
        self.username = username
        self.password = password
    }
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        username <- map["username"]
        password <- map["password"]
    }
    
}
