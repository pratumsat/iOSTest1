//
//  CustomerDetail.swift
//  iOSTest
//
//  Created by thnawat on 14/12/2563 BE.
//

import Foundation
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

class CustomerDetailApi {
    
    
    func callService(request: RequestCustomerDetail,
                              _ compilation: @escaping (RespondCustomerDetail) -> Void) {
        
        let url = Router.getCustomerDetail(request.toJSON()).apiModel
        Alamofire.request(url).responseObject { (response: DataResponse<RespondCustomerDetail>) in
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
