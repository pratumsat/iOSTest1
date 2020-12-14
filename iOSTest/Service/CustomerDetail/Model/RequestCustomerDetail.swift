//
//  RequestCustomerDetail.swift
//  iOSTest
//
//  Created by thnawat on 14/12/2563 BE.
//

import Foundation
import ObjectMapper

struct RequestCustomerDetail : Mappable {
    
    var token:String?
    var customerId:String?
    
    init(token: String , customerId:String?) {
        self.token = DataController.token
        self.customerId = customerId
    }
    
    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        token <- map["token"]
        customerId <- map["customerId"]
    }
    
}
