//
//  Router.swift
//  iOSTest
//
//  Created by thnawat on 14/12/2563 BE.
//

import Foundation
import Alamofire

enum Router {
    case Login(_ parameter:Parameters)
    case getCustomerDetail(_ parameter:Parameters)
    
    var apiModel : ApiModel {
        switch self {
        
        case .Login(let param):
            return ApiModel(path: "login", method: .post, param: param)
        case .getCustomerDetail(let param):
            return ApiModel(path: "getCustomerDetail", method: .post, param: param)
        }
    }
    
    
}

struct ApiModel:URLRequestConvertible {
    let base:String = "https://us-central1-iostesting-b3165.cloudfunctions.net/mobileApi/api/v1/"
    
    var path:String
    var method: Alamofire.HTTPMethod
    var param:Parameters?
  
    
   
    init (path:String?, method:Alamofire.HTTPMethod, param :Parameters? = nil)
    {
        self.path = path ?? ""
        self.method = method
        self.param = param
     
    }

    func asURLRequest() throws -> URLRequest {
        let model = self
        let url = URL(string: base + path )!
        var mutableURLRequest = URLRequest(url: url)
       
        mutableURLRequest.httpMethod = model.method.rawValue
        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        mutableURLRequest.httpBody = try! JSONSerialization.data(withJSONObject: model.param ?? [:])
        return mutableURLRequest
//        return try URLEncoding.default.encode(mutableURLRequest, with: model.param)
    }
}
