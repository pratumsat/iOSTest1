//
//  Login.swift
//  iOSTest
//
//  Created by thnawat on 14/12/2563 BE.
//

import Foundation
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

class LoginApi {
    
    
    func callService(request: RequestLogin,
                              _ compilation: @escaping (RespondLogin) -> Void) {
        
        let url = Router.Login(request.toJSON()).apiModel
        Alamofire.request(url).responseObject { (response: DataResponse<RespondLogin>) in
            switch response.result {
            case .success(_):
                let response = response.result.value!

                compilation(response)
            case .failure( let error):
                print("💙💙 \(error)")
                break
            }

        }
        
    }
     
}
